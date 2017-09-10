// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.twitch.tv/solo_nazgul
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
window.setTimeout(function(){
let messages = [];

var observer = new MutationObserver(function(mutations){
    mutations.forEach(function(mutation){
        if(mutation.addedNodes.length === 1 && mutation.addedNodes[0].hasChildNodes && mutation.addedNodes[0].childNodes.length === 4){
            const lineStuff = mutation.addedNodes[0].childNodes[2].children;
            const time = lineStuff[0].innerText;
            const name = lineStuff[2].innerText;
            const message = lineStuff[4].innerText;
            console.log("time: " + time + ", name: " + name + ", message: " + message);
            messages.push({time: time, name: name, message: message});
        }
    });
});

window.getMessages = (function(messages){ return function(){
 messages.forEach(function(msg){console.log("time: " + msg.time + ", name: " + msg.name + ", message: " + msg.message);});
};})(messages);

var config = {childList: true};

var chatList = document.querySelector('ul.chat-lines');

observer.observe(chatList, config);
}, 2000);
})();