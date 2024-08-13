"use strict";
chrome.bookmarks.onCreated.addListener(function (id, bookmark) {
    // network call to add bookmark to database
    console.log('onCreated', id, bookmark);
});
chrome.bookmarks.onChanged.addListener(function (id, changeInfo) {
    // network call to edit bookmark in database
    console.log('onChanged', id, changeInfo);
});
chrome.bookmarks.onRemoved.addListener(function (id, removeInfo) {
    // network call to remove bookmark from database
    console.log('onRemoved', id, removeInfo);
});
