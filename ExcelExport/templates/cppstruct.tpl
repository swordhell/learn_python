

#pragma once

#include "net_config_mgr.h"
#include "HLBase_Implement.h"

namespace net_config_mgr
{

#pragma pack(push, 1)
	//结构体
	struct HL{{name}}Struct
	{
			{% for f in numberfields %}{{f.type}} {{f.name}};
			{% endfor %}
			{% for f in strfields %}char {{f.name}}[{{f.size}}];
			{% endfor %}
	};
#pragma pack(pop)
	typedef std::vector<HL{{name}}Struct> TVecHL{{name}}Lst;

	class CHL{{name}} : public CHLBase_Implement
	{
	public:
		CHL{{name}}() {};
		virtual ~CHL{{name}}() {};
		
		TVecHL{{name}}Lst m_StructInfoLst;
	protected:
		virtual bool OnParseElement(tinyxml2::XMLElement * pItem)
		{
			HL{{name}}Struct item;

			{% for f in numberfields %}
			if (!LoadData(pItem,"{{f.name}}",item.{{f.name}}))
			{
				return false;
			}
			{% endfor %}
			{% for f in strfields %}
			if (!LoadData(pItem,"{{f.name}}",item.{{f.name}}))
			{
				return false;
			}
			{% endfor %}

			m_StructInfoLst.push_back(item);
			return true;
		}
	};

}
