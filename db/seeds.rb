# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

INGREDIENTS = [
  { name: 'cheese', regex: /ufoecrunnu/ },
  { name: 'sugar' },
  { name: 'chocolate' },
  { name: 'honey' },
  { name: 'parmesan' },
  { name: 'cheddar' },
  { name: 'american cheese' },
  { name: 'cream cheese' },
  { name: 'mozzarella' },
  { name: 'goat cheese' },
  { name: 'gouda' },
  { name: 'pepperjack cheese' },
  { name: 'romano' },
  { name: 'brie' },
  { name: 'pizza cheese' },
  { name: 'swiss cheese' },
  { name: 'gruyere' },
  { name: 'pecorino cheese' },
  { name: 'asiago' },
  { name: 'mascarpone' },
  { name: 'brick cheese' },
  { name: 'camembert cheese' },
  { name: 'edam cheese' },
  { name: 'manchego' },
  { name: 'stilton cheese' },
  { name: 'emmenthaler cheese' },
  { name: 'cottage cheese' },
  { name: 'queso fresco cheese' },
  { name: 'wensleydale cheese' },
  { name: 'longhorn cheese' },
  { name: 'double gloucester cheese' },
  { name: 'raclette cheese' },
  { name: 'lancashire cheese' },
  { name: 'cheshire cheese' },
  { name: 'red leicester cheese' },
  { name: 'jarlsberg cheese' },
  { name: 'bocconcini cheese' },
  { name: 'farmer cheese' },
  { name: 'garlic herb cheese' },
  { name: 'italian cheese' },
  { name: 'soft cheese' },
  { name: 'blue cheese' },
  { name: 'colby cheese' },
  { name: 'pepper jack' },
  { name: 'ricotta' },
  { name: 'feta' },
  { name: 'provolone' },
  { name: 'velveeta' },
  { name: 'teriyaki' },
  { name: 'tomato sauce' },
  { name: 'pesto' },
  { name: 'milk' },
  { name: 'powdered milk' },
  { name: 'condensed milk' },
  { name: 'couscous' },
  { name: 'sour cream' },
  { name: 'baking powder' },
  { name: 'yeast' },
  { name: 'yogurt' },
  { name: 'cream' },
  { name: 'evaporated milk' },
  { name: 'whipped cream' },
  { name: 'half and half cream' },
  { name: 'chips' },
  { name: 'monterey jack cheese' },
  { name: 'fish sauce' },
  { name: 'soy sauce' },
  { name: 'ice cream' },
  { name: 'tahini' },
  { name: 'tabasco' },
  { name: 'frosting' },
  { name: 'buttermilk' },
  { name: 'lard' },
  { name: 'margarine' },
  { name: 'coconut milk' },
  { name: 'almond milk' },
  { name: 'soy milk' },
  { name: 'rice milk' },
  { name: 'hemp milk' },
  { name: 'non dairy creamer' },
  { name: 'deer' },
  { name: 'spam' },
  { name: 'venison' },
  { name: 'elk' },
  { name: 'wild boar' },
  { name: 'rabbit' },
  { name: 'pheasant' },
  { name: 'quail' },
  { name: 'moose' },
  { name: 'oxtail' },
  { name: 'ostrich' },
  { name: 'snail' },
  { name: 'pigeon' },
  { name: 'grouse' },
  { name: 'sriracha' },
  { name: 'chickpea' },
  { name: 'lentil' },
  { name: 'soybeans' },
  { name: 'hummus' },
  { name: 'edamame' },
  { name: 'vegetables' },
  { name: 'onion' },
  { name: 'garlic' },
  { name: 'tomato' },
  { name: 'potato' },
  { name: 'carrot' },
  { name: 'pepper' },
  { name: 'basil' },
  { name: 'parsley' },
  { name: 'broccoli' },
  { name: 'corn' },
  { name: 'spinach' },
  { name: 'lettuce' },
  { name: 'green beans' },
  { name: 'ginger' },
  { name: 'chili pepper' },
  { name: 'celery' },
  { name: 'rosemary' },
  { name: 'red onion' },
  { name: 'cucumber' },
  { name: 'sweet potato' },
  { name: 'pickle' },
  { name: 'avocado' },
  { name: 'zucchini' },
  { name: 'frozen vegetables' },
  { name: 'olive' },
  { name: 'asparagus' },
  { name: 'cabbage' },
  { name: 'cauliflower' },
  { name: 'dill' },
  { name: 'kale' },
  { name: 'ramen' },
  { name: 'pumpkin' },
  { name: 'squash' },
  { name: 'mint' },
  { name: 'scallion' },
  { name: 'sun dried tomato' },
  { name: 'shallot' },
  { name: 'eggplant' },
  { name: 'beet' },
  { name: 'butternut squash' },
  { name: 'horseradish' },
  { name: 'leek' },
  { name: 'caper' },
  { name: 'brussels sprout' },
  { name: 'artichoke heart' },
  { name: 'chia seeds' },
  { name: 'radish' },
  { name: 'sauerkraut' },
  { name: 'artichoke' },
  { name: 'sweet pepper' },
  { name: 'arugula' },
  { name: 'spaghetti squash' },
  { name: 'capsicum' },
  { name: 'bok choy' },
  { name: 'parsnip' },
  { name: 'okra' },
  { name: 'yam' },
  { name: 'fennel' },
  { name: 'turnip' },
  { name: 'snow peas' },
  { name: 'bean sprouts' },
  { name: 'seaweed' },
  { name: 'chard' },
  { name: 'collard' },
  { name: 'canned tomato' },
  { name: 'pimiento' },
  { name: 'watercress' },
  { name: 'tomatillo' },
  { name: 'rocket' },
  { name: 'mustard greens' },
  { name: 'bamboo shoot' },
  { name: 'rutabaga' },
  { name: 'endive' },
  { name: 'broccoli rabe' },
  { name: 'jicama' },
  { name: 'kohlrabi' },
  { name: 'hearts of palm' },
  { name: 'butternut' },
  { name: 'celery root' },
  { name: 'daikon' },
  { name: 'radicchio' },
  { name: 'porcini' },
  { name: 'chinese broccoli' },
  { name: 'jerusalem artichoke' },
  { name: 'cress' },
  { name: 'water chestnut' },
  { name: 'dulse' },
  { name: 'micro greens' },
  { name: 'burdock' },
  { name: 'chayote' },
  { name: 'fruits' },
  { name: 'lemon' },
  { name: 'apple' },
  { name: 'banana' },
  { name: 'lime' },
  { name: 'strawberry' },
  { name: 'orange' },
  { name: 'pineapple' },
  { name: 'blueberry' },
  { name: 'raisin' },
  { name: 'coconut' },
  { name: 'grape' },
  { name: 'peach' },
  { name: 'raspberry' },
  { name: 'cranberry' },
  { name: 'mango' },
  { name: 'pear' },
  { name: 'blackberry' },
  { name: 'cherry' },
  { name: 'date' },
  { name: 'watermelon' },
  { name: 'berries' },
  { name: 'kiwi' },
  { name: 'grapefruit' },
  { name: 'mandarin' },
  { name: 'craisins' },
  { name: 'cantaloupe' },
  { name: 'plum' },
  { name: 'apricot' },
  { name: 'clementine' },
  { name: 'prunes' },
  { name: 'apple butter' },
  { name: 'pomegranate' },
  { name: 'nectarine' },
  { name: 'fig' },
  { name: 'tangerine' },
  { name: 'papaya' },
  { name: 'rhubarb' },
  { name: 'sultanas' },
  { name: 'plantain' },
  { name: 'currant' },
  { name: 'passion fruit' },
  { name: 'guava' },
  { name: 'persimmons' },
  { name: 'lychee' },
  { name: 'lingonberry' },
  { name: 'tangelos' },
  { name: 'kumquat' },
  { name: 'boysenberry' },
  { name: 'star fruit' },
  { name: 'quince' },
  { name: 'honeydew' },
  { name: 'crabapples' },
  { name: 'pork' },
  { name: 'pork shoulder' },
  { name: 'bacon' },
  { name: 'pork chops' },
  { name: 'ground pork' },
  { name: 'pork roast' },
  { name: 'pork ribs' },
  { name: 'pancetta' },
  { name: 'pork belly' },
  { name: 'pork loin' },
  { name: 'pork liver' },
  { name: 'lamb' },
  { name: 'lamb chops' },
  { name: 'ground lamb' },
  { name: 'leg of lamb' },
  { name: 'lamb shoulder' },
  { name: 'lamb shank' },
  { name: 'lamb loin' },
  { name: 'lamb liver' },
  { name: 'beef' },
  { name: 'ground beef' },
  { name: 'beef roast' },
  { name: 'corned beef' },
  { name: 'beef ribs' },
  { name: 'beef liver' },
  { name: 'beef shank' },
  { name: 'beef suet' },
  { name: 'beef sirloin' },
  { name: 'duck' },
  { name: 'duck liver' },
  { name: 'ham' },
  { name: 'pastrami' },
  { name: 'prosciutto' },
  { name: 'bologna' },
  { name: 'salami' },
  { name: 'soppressata' },
  { name: 'herbs' },
  { name: 'cilantro' },
  { name: 'veal' },
  { name: 'ground veal' },
  { name: 'veal cutlet' },
  { name: 'veal chops' },
  { name: 'veal shank' },
  { name: 'goose' },
  { name: 'goose liver' },
  { name: 'turkey' },
  { name: 'ground turkey' },
  { name: 'nuts' },
  { name: 'peanut butter' },
  { name: 'almonds' },
  { name: 'walnut' },
  { name: 'pecan' },
  { name: 'peanut' },
  { name: 'cashew' },
  { name: 'flax' },
  { name: 'pine nut' },
  { name: 'pistachio' },
  { name: 'almond meal' },
  { name: 'hazelnut' },
  { name: 'macadamia' },
  { name: 'almond paste' },
  { name: 'chestnuts' },
  { name: 'praline' },
  { name: 'macaroon' },
  { name: 'peanuts' },
  { name: 'oil' },
  { name: 'olive oil' },
  { name: 'vegetable oil' },
  { name: 'cooking spray' },
  { name: 'canola oil' },
  { name: 'sesame oil' },
  { name: 'coconut oil' },
  { name: 'peanut oil' },
  { name: 'sunflower oil' },
  { name: 'grape seed oil' },
  { name: 'corn oil' },
  { name: 'almond oil' },
  { name: 'avocado oil' },
  { name: 'safflower oil' },
  { name: 'walnut oil' },
  { name: 'hazelnut oil' },
  { name: 'palm oil' },
  { name: 'soybean oil' },
  { name: 'mustard oil' },
  { name: 'pistachio oil' },
  { name: 'soya oil' },
  { name: 'Beans' },
  { name: 'black beans' },
  { name: 'refried beans' },
  { name: 'chili beans' },
  { name: 'lima beans' },
  { name: 'kidney beans' },
  { name: 'pinto beans' },
  { name: 'navy beans' },
  { name: 'french beans' },
  { name: 'red beans' },
  { name: 'fava beans' },
  { name: 'great northern beans' },
  { name: 'cannellini beans' },
  { name: 'liver' },
  { name: 'turkey liver' },
  { name: 'liver sausage' },
  { name: 'foie gras' },
  { name: 'broth/soup/stock' },
  { name: 'stock' },
  { name: 'lamb stock' },
  { name: 'pork stock' },
  { name: 'veal stock' },
  { name: 'vegetable stock' },
  { name: 'chicken broth' },
  { name: 'mushroom soup' },
  { name: 'beef broth' },
  { name: 'tomato soup' },
  { name: 'soup' },
  { name: 'chicken soup' },
  { name: 'onion soup' },
  { name: 'vegetable soup' },
  { name: 'celery soup' },
  { name: 'vegetable bouillon' },
  { name: 'broth' },
  { name: 'pasta' },
  { name: 'spaghetti' },
  { name: 'linguine' },
  { name: 'fusilli' },
  { name: 'vermicelli' },
  { name: 'capellini' },
  { name: 'spaghettini' },
  { name: 'bucatini' },
  { name: 'Tagliatelle' },
  { name: 'pappardelle' },
  { name: 'fettuccine' },
  { name: 'lasagne' },
  { name: 'angel hair' },
  { name: 'ravioli' },
  { name: 'gnocchi' },
  { name: 'bread' },
  { name: 'bread crumbs' },
  { name: 'pretzel' },
  { name: 'cornbread' },
  { name: 'croutons' },
  { name: 'baguette' },
  { name: 'flour' },
  { name: 'pizza dough' },
  { name: 'flour tortillas' },
  { name: 'self rising flour' },
  { name: 'bread flour' },
  { name: 'puff pastry' },
  { name: 'seafood' },
  { name: 'shrimp' },
  { name: 'crab' },
  { name: 'prawns' },
  { name: 'scallop' },
  { name: 'clam' },
  { name: 'lobster' },
  { name: 'mussel' },
  { name: 'oyster' },
  { name: 'squid' },
  { name: 'calamari' },
  { name: 'crawfish' },
  { name: 'octopus' },
  { name: 'cockle' },
  { name: 'conch' },
  { name: 'sea urchin' },
  { name: 'Vinegar' },
  { name: 'wine vinegar' },
  { name: 'apple cider vinegar' },
  { name: 'cider vinegar' },
  { name: 'rice vinegar' },
  { name: 'champagne vinegar' },
  { name: 'Salad dressing' },
  { name: 'italian dressing' },
  { name: 'vinaigrette dressing' },
  { name: 'ranch dressing' },
  { name: 'blue cheese dressing' },
  { name: 'french dressing' },
  { name: 'sesame dressing' },
  { name: 'caesar dressing' },
  { name: 'cocktail sauce' },
  { name: 'fish' },
  { name: 'salmon' },
  { name: 'tilapia' },
  { name: 'fish fillets' },
  { name: 'cod' },
  { name: 'anchovy' },
  { name: 'smoked salmon' },
  { name: 'sardines' },
  { name: 'tuna' },
  { name: 'whitefish' },
  { name: 'halibut' },
  { name: 'trout' },
  { name: 'haddock' },
  { name: 'flounder' },
  { name: 'catfish' },
  { name: 'mahi mahi' },
  { name: 'mackerel' },
  { name: 'sole' },
  { name: 'sea bass' },
  { name: 'red snapper' },
  { name: 'swordfish' },
  { name: 'pollock' },
  { name: 'herring' },
  { name: 'perch' },
  { name: 'grouper' },
  { name: 'caviar' },
  { name: 'monkfish' },
  { name: 'rockfish' },
  { name: 'lemon sole' },
  { name: 'pike' },
  { name: 'barramundi' },
  { name: 'eel' },
  { name: 'bluefish' },
  { name: 'carp' },
  { name: 'cuttlefish' },
  { name: 'pompano' },
  { name: 'arctic char' },
  { name: 'john dory' },
  { name: 'marlin' },
  { name: 'amberjack' },
  { name: 'sturgeon' },
  { name: 'sausage' },
  { name: 'polish sausage' },
  { name: 'bratwurst' },
  { name: 'hot dog' },
  { name: 'pepperoni' },
  { name: 'chorizo' },
  { name: 'salad' },
  { name: 'mushroom' },
  { name: 'portobello mushroom' },
  { name: 'butter' },
  { name: 'ghee' },
  { name: 'chicken' },
  { name: 'chicken roast' },
  { name: 'chicken breast' },
  { name: 'chicken thighs' },
  { name: 'cooked chicken' },
  { name: 'chicken wings' },
  { name: 'ground chicken' },
  { name: 'chicken giblets' },
  { name: 'chicken tenders' },
  { name: 'rice' },
  { name: 'brown rice' },
  { name: 'basmati rice' },
  { name: 'jasmin rice' },
  { name: 'parboiled rice' },
  { name: 'egg' },
  { name: 'chicken egg' },
  { name: 'quail egg' },
  { name: 'ostrich egg' },
  { name: 'peas' },
  { name: 'split peas' },
  { name: 'snap peas' },
  { name: 'gravy' },
  { name: 'turkey gravy' },
  { name: 'mushroom gravy' },
  { name: 'sausage gravy' },
  { name: 'onion gravy' },
  { name: 'cream gravy' },
  { name: 'pork gravy' },
  { name: 'tomato gravy' },
  { name: 'giblet gravy' },
  { name: 'beef gravy' },
  { name: 'wine' },
  { name: 'white wine' },
  { name: 'red wine' },
  { name: 'cooking wine' },
  { name: 'dessert wine' },
  { name: 'port wine' },
  { name: 'sparkling wine' },
  { name: 'cabernet sauvignon' },
  { name: 'shaoxing wine' },
  { name: 'rice wine' },
  { name: 'noodle' },
  { name: 'udon noodle' },
  { name: 'shirataki noodle' },
  { name: 'alcohol' },
  { name: 'beer' },
  { name: 'schnapps' },
  { name: 'vodka' },
  { name: 'rum' },
  { name: 'whiskey' },
  { name: 'tequila' },
  { name: 'sherry' },
  { name: 'bourbon' },
  { name: 'vermouth' },
  { name: 'whisky' },
  { name: 'liqueur' },
  { name: 'brandy' },
  { name: 'gin' },
  { name: 'kahlua' },
  { name: 'irish cream' },
  { name: 'triple sec' },
  { name: 'champagne' },
  { name: 'amaretto' },
  { name: 'ciclon' },
  { name: 'drambuie' },
  { name: 'bitters' },
  { name: 'maraschino' },
  { name: 'sake' },
  { name: 'grand marnier' },
  { name: 'absinthe' },
  { name: 'madeira wine' },
  { name: 'ouzo' },
  { name: 'anisette' },
  { name: 'grappa' },
  { name: 'cognac' },
  { name: 'chocolate liqueur' },
  { name: 'burgundy wine' },
  { name: 'limoncello' },
  { name: 'creme de menthe' },
  { name: 'bloody mary' },
  { name: 'raspberry liquor' },
  { name: 'curacao' },
  { name: 'frangelico' },
  { name: 'meat' },
  { name: 'beef steak' },
  { name: 'chicken leg' },
  { name: 'marrow bones' },
  { name: 'sweetbread' },
  { name: 'alligator' }
]

INGREDIENT_GROUPS = {
  'cheese' => [
    'parmesan',
    'cheddar',
    'american cheese',
    'cream cheese',
    'mozzarella',
    'goat cheese',
    'gouda',
    'pepperjack cheese',
    'romano',
    'brie',
    'pizza cheese',
    'swiss cheese',
    'gruyere',
    'pecorino cheese',
    'asiago',
    'mascarpone',
    'brick cheese',
    'camembert cheese',
    'edam cheese',
    'manchego',
    'stilton cheese',
    'emmenthaler cheese',
    'cottage cheese',
    'queso fresco cheese',
    'wensleydale cheese',
    'longhorn cheese',
    'double gloucester cheese',
    'raclette cheese',
    'lancashire cheese',
    'cheshire cheese',
    'red leicester cheese',
    'jarlsberg cheese',
    'bocconcini cheese',
    'farmer cheese',
    'garlic herb cheese',
    'italian cheese',
    'soft cheese',
    'blue cheese',
    'colby cheese',
    'pepper jack',
    'cheese',
    'ricotta',
    'feta',
    'provolone',
    'velveeta'
  ],
  'mushroom' => [
    'portobello mushroom',
    'mushroom soup',
    'mushroom'
  ],
  'vegetables' => [
    'onion',
    'garlic',
    'tomato',
    'potato',
    'carrot',
    'pepper',
    'basil',
    'parsley',
    'broccoli',
    'corn',
    'spinach',
    'lettuce',
    'green beans',
    'ginger',
    'chili pepper',
    'celery',
    'rosemary',
    'red onion',
    'cucumber',
    'sweet potato',
    'pickle',
    'avocado',
    'zucchini',
    'frozen vegetables',
    'olive',
    'asparagus',
    'cabbage',
    'cauliflower',
    'dill',
    'kale',
    'pumpkin',
    'squash',
    'mint',
    'scallion',
    'sun dried tomato',
    'shallot',
    'eggplant',
    'beet',
    'butternut squash',
    'horseradish',
    'leek',
    'caper',
    'brussels sprout',
    'artichoke heart',
    'chia seeds',
    'radish',
    'sauerkraut',
    'artichoke',
    'sweet pepper',
    'arugula',
    'spaghetti squash',
    'capsicum',
    'bok choy',
    'parsnip',
    'okra',
    'yam',
    'fennel',
    'turnip',
    'snow peas',
    'bean sprouts',
    'seaweed',
    'chard',
    'collard',
    'canned tomato',
    'pimiento',
    'watercress',
    'tomatillo',
    'rocket',
    'mustard greens',
    'bamboo shoot',
    'rutabaga',
    'endive',
    'broccoli rabe',
    'jicama',
    'kohlrabi',
    'hearts of palm',
    'butternut',
    'celery root',
    'daikon',
    'radicchio',
    'porcini',
    'chinese broccoli',
    'jerusalem artichoke',
    'cress',
    'water chestnut',
    'dulse',
    'micro greens',
    'burdock',
    'chayote'
  ],
  'salad' => [
    'salad',
    'lettuce',
    'kale'
  ],
  'butter' => [
    'butter',
    'ghee'
  ],
  'cream' => [
    'ricotta',
    'cream'
  ],
  'fruits' => [
    'lemon',
    'apple',
    'banana',
    'lime',
    'strawberry',
    'orange',
    'pineapple',
    'blueberry',
    'raisin',
    'coconut',
    'grape',
    'peach',
    'raspberry',
    'cranberry',
    'mango',
    'pear',
    'blackberry',
    'cherry',
    'date',
    'watermelon',
    'berries',
    'kiwi',
    'grapefruit',
    'mandarin',
    'craisins',
    'cantaloupe',
    'plum',
    'apricot',
    'clementine',
    'prunes',
    'apple butter',
    'pomegranate',
    'nectarine',
    'fig',
    'tangerine',
    'papaya',
    'rhubarb',
    'sultanas',
    'plantain',
    'currant',
    'passion fruit',
    'guava',
    'persimmons',
    'lychee',
    'lingonberry',
    'tangelos',
    'kumquat',
    'boysenberry',
    'star fruit',
    'quince',
    'honeydew',
    'crabapples'
  ],
  'Beans' => [
    'green beans',
    'black beans',
    'beans',
    'refried beans',
    'chili beans',
    'lima beans',
    'kidney beans',
    'pinto beans',
    'navy beans',
    'french beans',
    'red beans',
    'fava beans',
    'great northern beans',
    'cannellini beans'
  ],
  'meat' => [
    'chicken breast',
    'ground beef',
    'bacon',
    'beef steak',
    'ham',
    'pork chops',
    'chicken thighs',
    'ground turkey',
    'cooked chicken',
    'turkey',
    'pork',
    'chicken leg',
    'ground pork',
    'chicken wings',
    'beef roast',
    'pork roast',
    'ground chicken',
    'pork ribs',
    'pork shoulder',
    'lamb',
    'corned beef',
    'chicken roast',
    'lamb chops',
    'pancetta',
    'ground lamb',
    'beef ribs',
    'duck',
    'pork belly',
    'beef liver',
    'leg of lamb',
    'beef shank',
    'veal',
    'chicken giblets',
    'lamb shoulder',
    'lamb shank',
    'deer',
    'ground veal',
    'rabbit',
    'pork loin',
    'elk',
    'beef suet',
    'veal cutlet',
    'lamb loin',
    'marrow bones',
    'goose',
    'chicken tenders',
    'veal chops',
    'quail',
    'oxtail',
    'pheasant',
    'lamb liver',
    'moose',
    'turkey liver',
    'pork liver',
    'veal shank',
    'beef sirloin',
    'sweetbread',
    'wild boar',
    'snail',
    'pigeon',
    'duck liver',
    'goose liver',
    'grouse',
    'ostrich',
    'alligator'
  ],
  'liver' => [
    'liver',
    'turkey liver',
    'lamb liver',
    'pork liver',
    'liver sausage',
    'foie gras',
    'duck liver',
    'goose liver'
  ],
  'chicken' => [
    'chicken roast',
    'chicken breast',
    'chicken',
    'chicken thighs',
    'cooked chicken',
    'chicken thighs',
    'chicken wings',
    'ground chicken',
    'chicken roast',
    'chicken giblets',
    'chicken tenders'
  ],
  'beef' => [
    'ground beef',
    'beef roast',
    'corned beef',
    'beef ribs',
    'beef liver',
    'beef shank',
    'beef suet',
    'beef sirloin'
  ],
  'pork' => [
    'pork shoulder',
    'bacon',
    'pork chops',
    'pork',
    'ground pork',
    'pork roast',
    'pork ribs',
    'pork shoulder',
    'pancetta',
    'pork belly',
    'pork loin',
    'pork liver'
  ],
  'lamb' => [
    'lamb',
    'lamb chops',
    'ground lamb',
    'leg of lamb',
    'lamb shoulder',
    'lamb shank',
    'lamb loin',
    'lamb liver'
  ],
  'sausage' => [
    'polish sausage',
    'bratwurst',
    'hot dog',
    'sausage',
    'pepperoni',
    'chorizo',
    'liver sausage'
  ],
  'goose' => [
    'goose',
    'goose liver'
  ],
  'turkey' => [
    'ground turkey',
    'turkey'
  ],
  'veal' => [
    'veal',
    'ground veal',
    'veal cutlet',
    'veal chops',
    'veal shank'
  ],
  'duck' => [
    'duck',
    'duck liver'
  ],
  'ham' => [
    'ham',
    'pancetta',
    'pastrami',
    'prosciutto',
    'prosciutto',
    'bologna',
    'salami',
    'soppressata'
  ],
  'herbs' => [
    'cilantro'
  ],
  'nuts' => [
    'peanut butter',
    'almonds',
    'walnut',
    'pecan',
    'peanut',
    'cashew',
    'flax',
    'pine nut',
    'pistachio',
    'almond meal',
    'hazelnut',
    'macadamia',
    'almond paste',
    'chestnuts',
    'praline',
    'macaroon',
    'peanuts',
    'nuts'
  ],
  'fish' => [
    'salmon',
    'tilapia',
    'fish fillets',
    'cod',
    'anchovy',
    'smoked salmon',
    'sardines',
    'tuna',
    'whitefish',
    'halibut',
    'trout',
    'haddock',
    'flounder',
    'catfish',
    'mahi mahi',
    'mackerel',
    'sole',
    'sea bass',
    'red snapper',
    'swordfish',
    'pollock',
    'herring',
    'perch',
    'grouper',
    'caviar',
    'monkfish',
    'rockfish',
    'lemon sole',
    'pike',
    'barramundi',
    'eel',
    'bluefish',
    'carp',
    'cuttlefish',
    'pompano',
    'arctic char',
    'john dory',
    'marlin',
    'amberjack',
    'sturgeon'
  ],
  'seafood' => [
    'shrimp',
    'crab',
    'prawns',
    'scallop',
    'clam',
    'lobster',
    'mussel',
    'oyster',
    'squid',
    'calamari',
    'crawfish',
    'octopus',
    'cockle',
    'conch',
    'sea urchin'
  ],
  'Vinegar' => [
    'wine vinegar',
    'apple cider vinegar',
    'cider vinegar',
    'rice vinegar',
    'vinegar',
    'champagne vinegar'
  ],
  'Salad dressing' => [
    'italian dressing',
    'salad dressing',
    'vinaigrette dressing',
    'ranch dressing',
    'blue cheese dressing',
    'french dressing',
    'sesame dressing',
    'caesar dressing',
    'cocktail sauce'
  ],
  'oil' => [
    'olive oil',
    'vegetable oil',
    'cooking spray',
    'canola oil',
    'sesame oil',
    'coconut oil',
    'peanut oil',
    'sunflower oil',
    'grape seed oil',
    'corn oil',
    'almond oil',
    'avocado oil',
    'safflower oil',
    'walnut oil',
    'hazelnut oil',
    'palm oil',
    'soybean oil',
    'mustard oil',
    'pistachio oil',
    'soya oil',
    'oil'
  ],
  'gravy' => [
    'turkey gravy',
    'mushroom gravy',
    'sausage gravy',
    'onion gravy',
    'cream gravy',
    'pork gravy',
    'tomato gravy',
    'giblet gravy',
    'beef gravy'
  ],
  'peas' => [
    'peas',
    'split peas',
    'snap peas'
  ],
  'egg' => [
    'egg',
    'chicken egg',
    'quail egg',
    'ostrich egg'
  ],
  'wine' => [
    'white wine',
    'wine',
    'red wine',
    'cooking wine',
    'dessert wine',
    'port wine',
    'sparkling wine',
    'cabernet sauvignon',
    'shaoxing wine',
    'rice wine'
  ],
  'broth/soup/stock' => [
    'stock',
    'lamb stock',
    'pork stock',
    'veal stock',
    'vegetable stock',
    'chicken broth',
    'mushroom soup',
    'beef broth',
    'tomato soup',
    'soup',
    'chicken soup',
    'onion soup',
    'vegetable soup',
    'celery soup',
    'vegetable bouillon',
    'broth'
  ],
  'rice' => [
    'rice',
    'brown rice',
    'basmati rice',
    'jasmin rice',
    'parboiled rice'
  ],
  'noodle' => [
    'noodle',
    'udon noodle',
    'shirataki noodle',
    'ramen'
  ],
  'pasta' => [
    'spaghetti',
    'pasta',
    'linguine',
    'fusilli',
    'vermicelli',
    'capellini',
    'spaghettini',
    'bucatini',
    'tagliatelle',
    'pappardelle',
    'fettuccine',
    'lasagne',
    'angel hair',
    'ravioli',
    'gnocchi'
  ],
  'alcohol' => [
    'beer',
    'schnapps',
    'vodka',
    'rum',
    'whiskey',
    'tequila',
    'sherry',
    'bourbon',
    'vermouth',
    'whisky',
    'liqueur',
    'brandy',
    'gin',
    'kahlua',
    'irish cream',
    'triple sec',
    'champagne',
    'amaretto',
    'ciclon',
    'drambuie',
    'bitters',
    'maraschino',
    'sake',
    'grand marnier',
    'absinthe',
    'madeira wine',
    'ouzo',
    'anisette',
    'grappa',
    'cognac',
    'chocolate liqueur',
    'burgundy wine',
    'limoncello',
    'creme de menthe',
    'bloody mary',
    'raspberry liquor',
    'curacao',
    'frangelico'
  ],
  'bread' => [
    'bread',
    'bread crumbs',
    'pretzel',
    'cornbread',
    'croutons',
    'baguette'
  ]
}

def generate_fake_recipes # needs revision, doesn't work currently
  50.times do
    name = Faker::Food.dish
    description = Faker::Food.description
    rating = rand(1..5)

    recipe = Recipe.new(
      name: name,
      description: description,
      rating: rating,
      url_image: "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/babaganoush_78707_16x9.jpg",
      url: "https://www.bbc.co.uk/food/recipes/baba_ganoush_grilled_50988"
      )
      recipe.save!

      all_ingredients = Ingredient.all
      rand(2..5).times do
        added_ingredient = all_ingredients.sample
      p Ingredient.all
      p added_ingredient
      p recipe
      dose = Dose.new(ingredient: added_ingredient, recipe: recipe)
        all_ingredients -= [added_ingredient]
      dose.save!
    end
  end
end

### destroy previous data
# Recipe.destroy_all
Dose.destroy_all
IngredientGroup.destroy_all
Ingredient.destroy_all

### read yaml files to import ingredients and ingredient groups
require 'yaml'
ingredients = YAML.load(File.read("db/yaml/ingredients.yml"))
ingredient_groups = YAML.load(File.read("db/yaml/ingredient_groups.yml"))

### generate and group ingredients
Ingredient.generate_ingredients(ingredients)
IngredientGroup.generate_ingredient_groups(ingredient_groups)
IngredientGroup.all.each { |ing_group| ing_group.group_ingredients!(ingredient_groups[ing_group.name]) }
Ingredient.all.each { |ing| ing.groupify }
### import recipes from URLs
# Url.all[0..5000].each { |url| url.import! }
Recipe.all.each { |recipe| recipe.scrape_ingredients! }


