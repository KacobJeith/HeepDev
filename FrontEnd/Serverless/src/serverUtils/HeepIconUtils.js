import fs from 'fs'
import path from 'path'

var iconContent = {};

export var SetClientIconFromString = (clientID, clientName, clientIconName) => {

  if (clientIconName == 'none') {
    var suggestedIcon = suggestIconForClient(clientName);
    console.log('Suggesting a default icon: ', suggestedIcon);
    clientIconName = suggestedIcon;
  }

  if (!(suggestedIcon in iconContent)) {
    SaveIconFromFile(suggestedIcon);
  }

  iconContent[clientID] = clientIconName;

}

export var GetIconContent = () => {
  return iconContent
}

export var suggestIconForClient = (clientName) => {
  var suggestedIcon = 'none';

  var defaultIcons = getDefaultIcons();
  var keywordReference = generateIconKeywords(defaultIcons);
  
  for (var keyword in keywordReference) {
    var lowercaseName = clientName.toLowerCase();
    if (lowercaseName.search(keyword) > -1){
      suggestedIcon = keywordReference[keyword];
    }
  }

  if (!(suggestedIcon in iconContent)) {
    SaveIconFromFile(suggestedIcon);
  }

  return suggestedIcon
}

var SaveIconFromFile = (clientIconName) => {
  var filepath = path.join(__dirname, '../assets/', clientIconName + '.svg');
  fs.readFile(filepath, (err, data) => {
    if (err) {
      console.error('SVG failed');
    } else {
      iconContent[clientIconName] = data.toString();
    }
  })
}


export var generateIconKeywords = (names) => {
  var keywords = {};

  for (var i = 0; i < names.length; i++){
    var words = names[i].split('-');
    for (var thisWord = 0; thisWord < words.length; thisWord++){
      var keyword = words[thisWord]
      keywords[keyword.toLowerCase()] = names[i];
    }
  }

  return keywords
}

export var getDefaultIcons = () => {
  var files = fs.readdirSync('./src/assets/');
  var svgs = [];

  for (var i = 0; i < files.length; i++){
    var splitFilename = files[i].split('.');
    if (splitFilename[1] == 'svg'){
      svgs.push(splitFilename[0]);
    }
  }

  return svgs
}