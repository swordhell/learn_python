
import { CardInfoTiny } from '../../resource.dto';

export const CardCfgs: CardInfoTiny[] = [
	{% for f in allNode %}{
    assetId: {{ f.AssetID }},
    TypeId: {{ f.AssetID }},
    Rarity: {{ f.Rarity }},
    Name: '{{ f.Name }}',
    Description:
      '{{ f.Description }}',
    Image: '{{ f.Image }}',
    WidgetImage: '',
    GifImage: '',
    Circulation: 99999999,
	},
	{% endfor %}];
