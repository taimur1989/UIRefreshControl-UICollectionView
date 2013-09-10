UIRefreshControl+UICollectionView=true
======================================

## The error
Calling -[refreshControl beginRefreshing] doesn't give any feedback, therefor I overrided the beginRefreshing to set the content offset on the superview and animate it smoothly.

There is also a bug where setting backgroundColor would end up in a unexpected behaviour, so I wrote a little warning.

UIRefreshControl as it should be. Now works great with UICollectionView.
iOS6+
