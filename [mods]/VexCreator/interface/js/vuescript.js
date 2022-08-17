
const app = new Vue({
    el: '#app',
    data: {
        Padres: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,42,43,44,45],
        Madres: [22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,46],
        Genetica: [
          {
            label: 'Генетика',
            default: 50,
            max: 100,
            min: 0,
            id: 'morfologia'
          },
          {
            label: 'Кожа',
            default: 50,
            max: 100,
            min: 0,
            id: 'piel'
          }
        ],
        Añadidos: [
          {
            label: 'Толщина губ',
            default: 0,
            max: 10,
            min: -10,
            id: 'lip-thickness'
          },
          {
            label: 'Толщина шеи',
            default: 0,
            max: 10,
            min: -10,
            id: 'neck-tickness'
          }
        ],
        Ropa: [
          {
            label: 'Под рубашкой',
            default: 0,
            max: 239,
            min: 0,
            id: 'tshirt'
          },
          {
            label: 'Цвет жилета',
            default: 0,
            max: 20,
            min: 0,
            id: 'tshirtcolor'
          },
          {
            label: 'Верхняя одежда',
            default: 0,
            max: 565,
            min: 0,
            id: 'torso'
          },
          {
            label: 'Цвет верхней одежды',
            default: 0,
            max: 20,
            min: 0,
            id: 'torsocolor'
          },
          {
            label: 'Руки',
            default: 0,
            max: 199,
            min: 0,
            id: 'arms'
          },
          {
            label: 'цвет перчаток',
            default: 0,
            max: 10,
            min: 0,
            id: 'armscolor'
          },
          {
            label: 'Штаны',
            default: 0,
            max: 212,
            min: 0,
            id: 'pants'
          },
          {
            label: 'Цвет брюк',
            default: 0,
            max: 15,
            min: 0,
            id: 'pantscolor'
          },
          {
            label: 'Обувь',
            default: 0,
            max: 137,
            min: 0,
            id: 'shoes'
          },
          {
            label: 'Цвет обуви',
            default: 0,
            max: 20,
            min: 0,
            id: 'shoescolor'
          },
          {
            label: 'Серьги',
            default: -1,
            max: 40,
            min: -1,
            id: 'ears'
          },
          {
            label: 'Цвет сережек',
            default: 0,
            max: 10,
            min: 0,
            id: 'earscolor'
          },
          {
            label: 'Подвески',
            default: 0,
            max: 150,
            min: 0,
            id: 'chain'
          },
          {
            label: 'Цвет подвесок',
            default: 0,
            max: 10,
            min: 0,
            id: 'chaincolor'
          },
          {
            label: 'Очки',
            default: -1,
            max: 33,
            min: -1,
            id: 'glasses'
          },
          {
            label: 'Цвет очков',
            default: 0,
            max: 10,
            min: 0,
            id: 'glassescolor'
          },
          {
            label: 'Часы',
            default: -1,
            max: 40,
            min: -1,
            id: 'watches'
          },
          {
            label: 'Цвет часов',
            default: 0,
            max: 10,
            min: 0,
            id: 'watchescolor'
          },
        ],
        Mandibula: [
          {
            label: 'Высота челюсти',
            default: 0,
            max: 10,
            min: -10,
            id: 'jawh'
          },
          {
            label: 'Ширина челюсти',
            default: 0,
            max: 10,
            min: -10,
            id: 'jaww'
          }
        ],
        Barbilla: [
          {
            label: 'Высота подбородка',
            default: 0,
            max: 10,
            min: -10,
            id: 'chinh'
          },
          {
            label: 'Длина подбородка',
            default: 0,
            max: 10,
            min: -10,
            id: 'chinl'
          },
          {
            label: 'Ширина подбородка',
            default: 0,
            max: 10,
            min: -10,
            id: 'chinw'
          },
          {
            label: 'Ямочка на подбородке',
            default: 0,
            max: 10,
            min: -10,
            id: 'chinhole'
          },
        ],
        OjosColor: [

          {
            color: '#263419',
            value: 1,
            id: 'eye2'
          },
          {
            color: '#83b7d5',
            value: 2,
            id: 'eye3'
          },
          {
            color: '#3e66a3',
            value: 3,
            id: 'eye4'
          },
          {
            color: '#8d6833',
            value: 4,
            id: 'eye5'
          },
          {
            color: '#523711',
            value: 5,
            id: 'eye6'
          },
          {
            color: '#d08418',
            value: 6,
            id: 'eye7'
          },
          {
            color: '#bebebe',
            value: 8,
            id: 'eye8'
          },
          {
            color: '#0d0d0c',
            value: 12,
            id: 'eye9'
          },
        ],
        CejasColor: [

          {
            color: '#ffffff',
            value: 29,
            id: 'ccm2'
          },
          {
            color: '#7a5530',
            value: 9,
            id: 'ccm3'
          },
          {
            color: '#b4b57b',
            value: 14,
            id: 'ccm4'
          },
          {
            color: '#7d7d7d',
            value: 28,
            id: 'ccm5'
          },
          {
            color: '#531f54',
            value: 31,
            id: 'ccm6'
          },
          {
            color: '#c382c4',
            value: 35,
            id: 'ccm7'
          },
          {
            color: '#59bfd4',
            value: 41,
            id: 'ccm8'
          },
        ],
        Ojos: [
          {
            label: 'Открытие глаз',
            default: 0,
            max: 10,
            min: -10,
            id: 'eyesquint'
          },
          {
            label: 'высота бровей',
            default: 0,
            max: 10,
            min: -10,
            id: 'eyesbrowh',
            left: '-',
            right: '+'
          },
          {
            label: 'Глубина бровей',
            default: 0,
            max: 10,
            min: -10,
            id: 'eyesbrowd'
          },
        ],
        Nariz: [
          {
            label: 'Ширина носа',
            default: 0,
            max: 10,
            min: -10,
            id: 'nosewidth'
          },
          {
            label: 'Высота носа',
            default: 0,
            max: 10,
            min: -10,
            id: 'noseh'
          },
          {
            label: 'Длина носа',
            default: 0,
            max: 10,
            min: -10,
            id: 'nosepeakl'
          },
          {
            label: 'Высота носовой перегородки',
            default: 0,
            max: 10,
            min: -10,
            id: 'noseboneh'
          },
          {
            label: 'Высота кончика носа',
            default: 0,
            max: 10,
            min: -10,
            id: 'nosepeakh'
          },
          {
            label: 'Скручивание носа',
            default: 0,
            max: 10,
            min: -10,
            id: 'nosetwist'
          },
        ],
        Pomulos: [
          {
            label: 'Высота скул',
            default: 0,
            max: 10,
            min: -10,
            id: 'cheekboneh'
          },
          {
            label: 'Ширина скул',
            default: 0,
            max: 10,
            min: -10,
            id: 'cheekbonew'
          },
          {
            label: 'Ширина щек',
            default: 0,
            max: 10,
            min: -10,
            id: 'cheekw'
          },
        ],
        Piel: [
          {
            label: 'Проблемы с кожей',
            default: 0,
            max: 11,
            min: 0,
            id: 'ppiel'
          },
          {
            label: 'Выраженные проблемы с кожей',
            default: 0,
            max: 10,
            min: 0,
            id: 'ppielp'
          },
          {
            label: 'Родимые пятна',
            default: 0,
            max: 17,
            min: 0,
            id: 'marcas'
          },
          {
            label: 'Произносимые знаки',
            default: 0,
            max: 10,
            min: 0,
            id: 'marcasp'
          },
          {
            label: 'Шрамы',
            default: 0,
            max: 17,
            min: 0,
            id: 'cicatrices'
          },
          {
            label: 'Ярко выраженные шрамы',
            default: 0,
            max: 10,
            min: 0,
            id: 'cicatricesp'
          },
          {
            label: 'Морщины',
            default: 0,
            max: 14,
            min: 0,
            id: 'arrugas'
          },
          {
            label: 'Произносится от морщин',
            default: 0,
            max: 10,
            min: 0,
            id: 'arrugasp'
          },
        ],
        Pelo: [
          {
            label: 'Прическа',
            default: 0,
            max: 173,
            min: 0,
            id: 'hair'
          },
          {
            label: 'Цвет прически',
            default: 0,
            max: 4,
            min: 0,
            id: 'hair2'
          },
        ],
        PelosColor: [

          {
            color: '#4B392D',
            value: 2,
            id: 'p2'
          },
          {
            color: '#7A3B1F',
            value: 4,
            id: 'p3'
          },
          {
            color: '#A35631',
            value: 6,
            id: 'p4'
          },
          {
            color: '#A96F49',
            value: 8,
            id: 'p5'
          },
          {
            color: '#BD8D5E',
            value: 10,
            id: 'p6'
          },
          {
            color: '#CBA66F',
            value: 12,
            id: 'p7'
          },
          {
            color: '#E8BE78',
            value: 14,
            id: 'p8'
          },
          {
            color: '#D09E6A',
            value: 16,
            id: 'p9'
          },
          {
            color: '#993524',
            value: 18,
            id: 'p10'
          },
          {
            color: '#9C1611',
            value: 20,
            id: 'p11'
          },
          {
            color: '#D1381E',
            value: 22,
            id: 'p12'
          },
          {
            color: '#C85831',
            value: 24,
            id: 'p13'
          },
          {
            color: '#947A67',
            value: 26,
            id: 'p14'
          },
          {
            color: '#D8C1AC',
            value: 28,
            id: 'p15'
          },
          {
            color: '#734F61',
            value: 30,
            id: 'p16'
          },
          {
            color: '#AD476A',
            value: 32,
            id: 'p17'
          },
          {
            color: '#FFAEBC',
            value: 35,
            id: 'p18'
          },
          {
            color: '#089A8D',
            value: 36,
            id: 'p19'
          },
          {
            color: '#309060',
            value: 40,
            id: 'p20'
          },
          {
            color: '#A3C015',
            value: 43,
            id: 'p21'
          },
          {
            color: '#EEC85C',
            value: 45,
            id: 'p22'
          },
          {
            color: '#FE8B10',
            value: 48,
            id: 'p23'
          },
          {
            color: '#D40B0E',
            value: 53,
            id: 'p24'
          },
        ],
        MechasColor: [

          {
            color: '#4B392D',
            value: 2,
            id: 'pm2'
          },
          {
            color: '#7A3B1F',
            value: 4,
            id: 'pm3'
          },
          {
            color: '#A35631',
            value: 6,
            id: 'pm4'
          },
          {
            color: '#A96F49',
            value: 8,
            id: 'pm5'
          },
          {
            color: '#BD8D5E',
            value: 10,
            id: 'pm6'
          },
          {
            color: '#CBA66F',
            value: 12,
            id: 'pm7'
          },
          {
            color: '#E8BE78',
            value: 14,
            id: 'pm8'
          },
          {
            color: '#D09E6A',
            value: 16,
            id: 'pm9'
          },
          {
            color: '#993524',
            value: 18,
            id: 'pm10'
          },
          {
            color: '#9C1611',
            value: 20,
            id: 'pm11'
          },
          {
            color: '#D1381E',
            value: 22,
            id: 'pm12'
          },
          {
            color: '#C85831',
            value: 24,
            id: 'pm13'
          },
          {
            color: '#947A67',
            value: 26,
            id: 'pm14'
          },
          {
            color: '#D8C1AC',
            value: 28,
            id: 'pm15'
          },
          {
            color: '#734F61',
            value: 30,
            id: 'pm16'
          },
          {
            color: '#AD476A',
            value: 32,
            id: 'pm17'
          },
          {
            color: '#FFAEBC',
            value: 35,
            id: 'pm18'
          },
          {
            color: '#089A8D',
            value: 36,
            id: 'pm19'
          },
          {
            color: '#309060',
            value: 40,
            id: 'pm20'
          },
          {
            color: '#A3C015',
            value: 43,
            id: 'pm21'
          },
          {
            color: '#EEC85C',
            value: 45,
            id: 'pm22'
          },
          {
            color: '#FE8B10',
            value: 48,
            id: 'pm23'
          },
          {
            color: '#D40B0E',
            value: 53,
            id: 'pm24'
          },
        ],
        Cejas: [
          {
            label: 'Форма бровей',
            default: 0,
            max: 34,
            min: 0,
            id: 'cejas'
          },
          {
            label: 'Толщина бровей',
            default: 10,
            max: 10,
            min: 0,
            id: 'cejasp'
          }
        ],
        Maquillaje: [
          {
            label: 'Тени для век/форма лица',
            default: 0,
            max: 71,
            min: 0,
            id: 'makeuptype'
          },
          {
            label: 'Толщина грима',
            default: 0,
            max: 10,
            min: 0,
            id: 'makeupintensidad'
          }
        ],
        Pintalabios: [
          {
            label: 'Форма макияжа губ',
            default: 0,
            max: 9,
            min: 0,
            id: 'lipsticktype'
          },
          {
            label: 'Толщина помады',
            default: 0,
            max: 32,
            min: 0,
            id: 'lipstickintensidad'
          }
        ],
        Colorete: [
          {
            label: 'Форма для макияжа с румянами',
            default: 0,
            max: 9,
            min: 0,
            id: 'blushtype'
          },
          {
            label: 'Толщина грима',
            default: 0,
            max: 10,
            min: 0,
            id: 'blushintensidad'
          }
        ],
        Barba: [
          {
            label: 'Тип бороды',
            default: 0,
            max: 28,
            min: 0,
            id: 'barba'
          },
          {
            label: 'Толщина бороды',
            default: 0,
            max: 10,
            min: 0,
            id: 'barbap'
          }
        ],
        BarbaColor: [

          {
            color: '#4B392D',
            value: 2,
            id: 'bb2'
          },
          {
            color: '#7A3B1F',
            value: 4,
            id: 'bb3'
          },
          {
            color: '#A35631',
            value: 6,
            id: 'bb4'
          },
          {
            color: '#A96F49',
            value: 8,
            id: 'bb5'
          },
          {
            color: '#BD8D5E',
            value: 10,
            id: 'bb6'
          },{
            color: '#CBA66F',
            value: 12,
            id: 'bb7'
          },{
            color: '#E8BE78',
            value: 14,
            id: 'bb8'
          },{
            color: '#D09E6A',
            value: 16,
            id: 'bb9'
          },{
            color: '#C85831',
            value: 24,
            id: 'bb10'
          },{
            color: '#947A67',
            value: 26,
            id: 'bb11'
          },{
            color: '#D8C1AC',
            value: 28,
            id: 'bb12'
          }
        ],
        MaquillajeColor: [

          {
            color: '#363535',
            value: 27,
            id: 'mc2',
            id2: 'mcc2'
          },
          {
            color: '#636363',
            value: 28,
            id: 'mc3',
            id2: 'mcc3'
          },
          {
            color: '#9528a8',
            value: 33,
            id: 'mc4',
            id2: 'mcc4'
          },
          {
            color: '#ba2f80',
            value: 34,
            id: 'mc5',
            id2: 'mcc5'
          },
          {
            color: '#f246ea',
            value: 35,
            id: 'mc6',
            id2: 'mcc6'
          },{
            color: '#329cc7',
            value: 36,
            id: 'mc7',
            id2: 'mcc7'
          },{
            color: '#1d4f63',
            value: 38,
            id: 'mc8',
            id2: 'mcc8'
          },{
            color: '#204f15',
            value: 42,
            id: 'mc9',
            id2: 'mcc9'
          },{
            color: '#75b32e',
            value: 43,
            id: 'mc10',
            id2: 'mcc10'
          },{
            color: '#a38c48',
            value: 45,
            id: 'mc11',
            id2: 'mcc11'
          },{
            color: '#bf570d',
            value: 47,
            id: 'mc12',
            id2: 'mcc12'
          },{
            color: '#bf0d0d',
            value: 50,
            id: 'mc13',
            id2: 'mcc13'
          },{
            color: '#6e1a1a',
            value: 53,
            id: 'mc14',
            id2: 'mcc14'
          },{
            color: '#000000',
            value: 61,
            id: 'mc15',
            id2: 'mcc15'
          },
        ],
        PintalabiosColor: [

          {
            color: '#594933',
            value: 4,
            id: 'lc2'
          },
          {
            color: '#877050',
            value: 6,
            id: 'lc3'
          },
          {
            color: '#696969',
            value: 26,
            id: 'lc4'
          },
          {
            color: '#ffffff',
            value: 29,
            id: 'lc5'
          },
          {
            color: '#916294',
            value: 30,
            id: 'lc6'
          },
          {
            color: '#000000',
            value: 61,
            id: 'lc7'
          },
          {
            color: '#3d3d3d',
            value: 58,
            id: 'lc8'
          },
          {
            color: '#82302e',
            value: 54,
            id: 'lc9'
          },
          {
            color: '#d10700',
            value: 53,
            id: 'lc10'
          },
          {
            color: '#d18f00',
            value: 52,
            id: 'lc11'
          },
          {
            color: '#f0c465',
            value: 51,
            id: 'lc12'
          },
          {
            color: '#9e9b4d',
            value: 47,
            id: 'lc13'
          },
          {
            color: '#14b824',
            value: 44,
            id: 'lc14'
          },
          {
            color: '#91ed9a',
            value: 42,
            id: 'lc15'
          },
          {
            color: '#1947c2',
            value: 38,
            id: 'lc16'
          },
          {
            color: '#7ea0fc',
            value: 36,
            id: 'lc17'
          },
          {
            color: '#f598d0',
            value: 35,
            id: 'lc18'
          },
          {
            color: '#e00087',
            value: 34,
            id: 'lc19'
          },
          {
            color: '#9c1f6a',
            value: 33,
            id: 'lc20'
          },
        ],
        ColoreteColor: [

          {
            color: '#ff8cf7',
            value: 3,
            id: 'bc2'
          },
          {
            color: '#f2e1d0',
            value: 7,
            id: 'bc3'
          },
          {
            color: '#fff5eb',
            value: 8,
            id: 'bc4'
          },
          {
            color: '#ffffff',
            value: 9,
            id: 'bc5'
          },
          {
            color: '#fcf0fc',
            value: 10,
            id: 'bc6'
          },
          {
            color: '#f7b763',
            value: 12,
            id: 'bc7'
          },
          {
            color: '#ff9100',
            value: 13,
            id: 'bc8'
          },
          {
            color: '#8a8348',
            value: 49,
            id: 'bc9'
          },
          {
            color: '#3b3a3a',
            value: 62,
            id: 'bc10'
          },
          {
            color: '#000000',
            value: 63,
            id: 'bc11'
          },
          {
            color: '#802d2d',
            value: 21,
            id: 'bc12'
          },
          {
            color: '#ff0000',
            value: 22,
            id: 'bc13'
          },
          {
            color: '#ff6e6e',
            value: 5,
            id: 'bc14'
          },
        ],
    }
});