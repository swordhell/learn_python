#! /usr/bin/python3.7
# -*- coding: utf-8 -*-
# pip install -r requirements.txt
# 
# 如果需要打包成exe的话需要手动执行
# pip install https://github.com/pyinstaller/pyinstaller/archive/develop.tar.gz
# pylint
# 
import xlrd
import os
import logging
import time
import re
from jinja2 import Environment, PackageLoader
import glob
import codecs
import glob

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s', datefmt='%Y-%m-%d %H:%M:%S')

# 设置到自己的目录中
PATH_OUTPUT="../output"
XMLCONFIG_OUTPUT="../output_path/"
GODEF_OUTPUT="./output_path/"

# 正则表达式部分
# MagDefU(UINT16)
g_re_head_catch = re.compile(r"(\w+)\(([\[\]\w\d]+)\)")         # 抓表头
g_re_replace_comment = re.compile(r"^//")                       # 抓注释
# 检查是否为服务器独有
re_svr_only = re.compile(r"^S_")
re_cli_only = re.compile(r"^C_")
re_svr_cli_only = re.compile(r"^[SC]_")
def is_svr_only(_name):
    result = re_svr_only.findall(_name)
    return len(result) != 0
def is_cli_only(_name):
    result = re_cli_only.findall(_name)
    return len(result) != 0
def trim_field_pre(_name):
    return re_svr_cli_only.sub('',_name,1)

class excel_field():
    def __init__(self):
        pass
    
    def read_field_str(self,_comment,_init_str,_column):
        if type(_init_str) != str:
            return False
        result = g_re_head_catch.findall(_init_str)
        if len(result) == 0:
            return False
        if len(result[0]) != 2:
            return False
        self.name_ = result[0][0]
        self.type_ = result[0][1]
        self.comment_ = (g_re_replace_comment.sub("",_comment)).strip()
        self.column_ = _column
        return True
    def fetch_value(self,_value):
        if self.type_ == "int":
            if _value == "":
                return 0
            return int(float(_value))
        return _value
    pass

# 数据加载
class export_pad():
    def __init__(self,_filename,_out):
        data = xlrd.open_workbook(_filename)
        self.xls_table_ = data.sheet_by_index(0)
        self.output_path_ = _out
        self.comment_ = []
        self.head_ = []
        self.records_ = []
        self.filename_ = _filename
        self.name_ = os.path.split(self.filename_)[1]
        self.raw_name_, _extension = os.path.splitext(self.name_)
        pass

    def is_escape_row(self,value):
        if type(value) != str:
            return False
        result = g_re_replace_comment.findall(value)
        return len(result) == 1

        
    def load_head(self):
        table = self.xls_table_
        ncols = table.ncols
        for col in range(0,ncols):
            comment = table.cell(0,col).value
            value = table.cell(1,col).value
            if value == "":
                continue
            f = excel_field()
            if not f.read_field_str(comment,value,col):
                continue

            self.head_.append(f)

        nrows = table.nrows
        for row in range(2,nrows):
            if self.is_escape_row(table.cell(row,0).value):
                continue
            record = []
            for f in self.head_:
                record.append( f.fetch_value( table.cell(row,f.column_).value ) )
            self.records_.append(record)

# 导出xml文件
class export_xml():
    def __init__(self,_pad,_out):
        self.pad_ = _pad
        self.out_ = _out
        self.name_,self.raw_name_ = _pad.name_,_pad.raw_name_
        pass
    def to_xml(self):
        if not os.path.isdir(XMLCONFIG_OUTPUT):
            os.mkdir(XMLCONFIG_OUTPUT)
        outputfilename = "{1}{0}.xml".format(self.raw_name_,XMLCONFIG_OUTPUT)
        with codecs.open(outputfilename,"w",encoding='utf-8') as ofd:
            ofd.write('<?xml version="1.0" encoding="utf-8" ?>\n<root>\n')
            for record in self.pad_.records_:
                ofd.write("\t<Item")
                f = 0
                for field in self.pad_.head_:
                    ofd.write(' {0}="{1}"'.format(field.name_,record[f]))
                    f = f + 1
                ofd.write("/>\n")
            ofd.write('</root>')
        pass
    pass

# 导出json
class export_json():
    def __init__(self,_pad,_out):
        self.pad_ = _pad
        self.out_ = _out
        self.name_,self.raw_name_ = _pad.name_,_pad.raw_name_
        self.init_output_path()
        pass
    def init_output_path(self):
        paths = [ self.out_ + "/server", self.out_ + "/client" ]
        for path in paths:
            if not os.path.isdir(path):
                os.mkdir(path)
    
    def pack_field_data(self,_data,_type):
        if _type == "str":
            return '"{0}"'.format(_data)
        return _data
    def export(self):
        c_filename = "{0}/client/{1}.json".format(self.out_,self.raw_name_)
        s_filename = "{0}/server/{1}.json".format(self.out_,self.raw_name_)
        with codecs.open(c_filename,"w",encoding='utf-8') as cfd:
            with codecs.open(s_filename,"w",encoding='utf-8') as sfd:
                cfd.write('{\n\t"items": [\n')
                sfd.write('{\n\t"items": [\n')
                row_idx = 0
                row_max = len(self.pad_.records_)
                for record in self.pad_.records_:
                    row_idx += 1
                    cfd.write("\t{")
                    sfd.write("\t{")
                    f = 0
                    c_str = ""
                    s_str = ""
                    for field in self.pad_.head_:
                        fix_val = self.pack_field_data(record[f],field.type_)
                        tmp_str = ', "{0}": {1}'.format(field.name_,fix_val)
                        if is_cli_only(field.name_):
                            c_str += tmp_str
                        elif is_svr_only(field.name_):
                            s_str += tmp_str
                        else:
                            c_str += tmp_str
                            s_str += tmp_str
                        f = f + 1
                    c_str = c_str[1:]
                    s_str = s_str[1:]
                    if row_max != row_idx:
                        cfd.write(c_str+"},\n")
                        sfd.write(s_str+"},\n")
                    else:
                        cfd.write(c_str+"}\n")
                        sfd.write(s_str+"}\n")


                cfd.write("\t]\n}")
                sfd.write("\t]\n}")

# 导出lua
class export_lua():
    def __init__(self,_pad,_out):
        self.pad_ = _pad
        self.out_ = _out
        self.name_,self.raw_name_ = _pad.name_,_pad.raw_name_
        self.init_output_path()
        pass
    def init_output_path(self):
        paths = [ self.out_ + "/server", self.out_ + "/client" ]
        for path in paths:
            if not os.path.isdir(path):
                os.mkdir(path)
    
    def pack_field_data(self,_data,_type):
        if _type == "str":
            return '"{0}"'.format(_data)
        if _type == "tab":
            return '{0}'.format(_data)
        return _data
    def export(self):
        c_filename = "{0}/client/{1}.lua".format(self.out_,self.raw_name_)
        s_filename = "{0}/server/{1}.lua".format(self.out_,self.raw_name_)
        c_filename_def = "{0}/client/{1}_def.lua".format(self.out_,self.raw_name_)
        s_filename_def = "{0}/server/{1}_def.lua".format(self.out_,self.raw_name_)
        with codecs.open(c_filename,"w",encoding='utf-8') as cfd, codecs.open(s_filename,"w",encoding='utf-8') as sfd,codecs.open(c_filename_def,"w",encoding='utf-8') as cfd_def, codecs.open(s_filename_def,"w",encoding='utf-8') as sfd_def:
                cfd.write("local {0}".format(self.raw_name_))
                sfd.write("""module("resmgr")\n{0}""".format(self.raw_name_))

                sfd_def.write("""module("resmgr")\n""")

                cfd.write(' = {\n\t\n')
                sfd.write(' = {\n\t\n')
                row_idx = 0
                row_max = len(self.pad_.records_)
                # 宏定义字符串
                def_str = ""
                need_def_str = False
                if self.pad_.head_[1].name_ == "OnlyId":
                    need_def_str = True
                for record in self.pad_.records_:
                    row_idx += 1
                    cfd.write("\t{")
                    sfd.write("\t{")
                    f = 0
                    c_str = ""
                    s_str = ""
                    if need_def_str:
                        def_str = def_str + "{0}={1}\n".format(record[1],record[0])
                    for field in self.pad_.head_:
                        fix_val = self.pack_field_data(record[f],field.type_)
                        tmp_str = ', {0}= {1}'.format(field.name_,fix_val)
                        if is_cli_only(field.name_):
                            c_str += tmp_str
                        elif is_svr_only(field.name_):
                            s_str += tmp_str
                        else:
                            c_str += tmp_str
                            s_str += tmp_str
                        f = f + 1
                    c_str = c_str[1:]
                    s_str = s_str[1:]
                    if row_max != row_idx:
                        cfd.write(c_str+"},\n")
                        sfd.write(s_str+"},\n")
                    else:
                        cfd.write(c_str+"}\n")
                        sfd.write(s_str+"}\n")

                cfd.write("\n}\nreturn ")
                sfd.write("\n}\n")
                cfd.write(self.raw_name_)
                cfd_def.write(def_str)
                sfd_def.write(def_str)


# 导出golang
convert_field_type ={
    "int" : "int32"
}
class export_golang_def():
    def __init__(self,_pad,_out):
        self.pad_ = _pad
        self.out_ = _out
        self.name_,self.raw_name_ = _pad.name_,_pad.raw_name_
        env = Environment(loader=PackageLoader('export_excel', 'templates'))
        self.template = env.get_template('gostruct.tpl')
        fields = []
        for f in self.pad_.head_:
            node = {}
            node["name"] = f.name_
            if f.type_ in convert_field_type:
                node["type"] = convert_field_type[f.type_]
            else:
                node["type"] = "string"
            fields.append(node)
        outputstr = self.template.render(fields=fields,name=self.raw_name_,cfgFileName="{0}.json".format(self.raw_name_))
        if not os.path.isdir(GODEF_OUTPUT):
            os.mkdir(GODEF_OUTPUT)
        outputfilename = "{1}cfg_{0}.go".format(self.raw_name_,GODEF_OUTPUT).lower()
        with codecs.open(outputfilename,"w",encoding='utf-8') as fd:
            fd.write(outputstr)
        pass
    def output_def(self):
        pass

cpp_convert_field_type ={
    "int" : "uint32_t",
    "str" : "std::string"
}


class export_cpp_def():
    def __init__(self,_pad,_out):
        self.pad_ = _pad
        self.out_ = _out
        self.name_,self.raw_name_ = _pad.name_,_pad.raw_name_
        env = Environment(loader=PackageLoader('export_excel', 'templates'))
        self.template = env.get_template('cppstruct.tpl')

        re_array_char = re.compile(r"char\[(\d+)]")
        numberfields = []
        strfields = []
        for f in self.pad_.head_:
            if is_cli_only(f.name_):
                continue
            node = {}
            node["name"] = f.name_
            if is_svr_only(f.name_):
                node["name"] = trim_field_pre(f.name_)
            if f.type_ in cpp_convert_field_type:
                node["type"] = cpp_convert_field_type[f.type_]
                numberfields.append(node)
            else:
                result = re_array_char.findall(f.type_)
                if len(result) != 0:
                    node["type"] = "str"
                    node["size"] = result[0]
                    strfields.append(node)


                pass
        outputstr = self.template.render(numberfields=numberfields
            , strfields = strfields, name=self.raw_name_,xmlFileName="{0}.xml".format(self.raw_name_))

        outputfilename = "./NHL{0}.hpp".format(self.raw_name_)
        with codecs.open(outputfilename,"w",encoding='utf-8') as fd:
            fd.write(outputstr)
        pass
    def output_def(self):
        pass

def export_single_data(_exc,_out):
    logging.debug("excel_file: {0}, out: {1}".format(_exc, _out))
    pad = export_pad(_exc,_out)
    pad.load_head()
    # x = export_xml(pad,_out)
    # x.to_xml()
    # go = export_golang_def(pad,_out)
    # go.output_def()
    # cpp = export_cpp_def(pad,_out)
    # cpp.output_def()
    # json = export_json(pad,_out)
    # json.export()
    lua = export_lua(pad,_out)
    lua.export()

def export_item_file():
    for filename in glob.glob("./excel_path/*.xlsx"):
        export_single_data(filename,"./output_path")

def main():
    export_item_file()

if __name__ == "__main__":
    main()
