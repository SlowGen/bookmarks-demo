// For more on extension service workers, see https://developer.chrome.com/docs/extensions/develop/concepts/service-workers

chrome.bookmarks.onCreated.addListener(
  (id: string, bookmark: chrome.bookmarks.BookmarkTreeNode) => {
    // network call to add bookmark to database
    console.log('onCreated', id, bookmark);
  }
)

chrome.bookmarks.onChanged.addListener(
  (id: string, changeInfo: chrome.bookmarks.BookmarkChangeInfo) => {
    // network call to edit bookmark in database
    console.log('onChanged', id, changeInfo);
  }
)

chrome.bookmarks.onRemoved.addListener(
  (id: string, removeInfo: chrome.bookmarks.BookmarkRemoveInfo) => {
    // network call to remove bookmark from database
    console.log('onRemoved', id, removeInfo);
  }
)
