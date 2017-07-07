
onmessage = function(event) {
  if(event.data.type == "setup"){
    importScripts(event.data.url);
  }
  else{
    postMessage(generateSpeech(event.data.text, event.data.args));
  }
};

