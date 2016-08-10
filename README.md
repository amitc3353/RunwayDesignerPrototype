# RunwayDesignerPrototype

Architecture varies with ViewController, Models, Networking and Database. Below are the key components:

•	RDRequestManager is a singleton with a shared NSURLSession executing the network calls.

•	RDRandomItemsStore responsible for JSON parsing of objects.

•	Model RandomItemImage with thumbnail and full size URLs. Thumbnail URLs are helpful in case of low connectivity of Internet for images.

•	Among the designer list the ones who does not have any random item in their name, I simply put an Alert with “No Info found”. 

•	A collectionView for Image scrolling. I find using collectionViews better rather than ScrollView-ImageView slider because it’s easier-readable code plus it’s ability to extend for future implementations.

•	A simple dropdown animation with tableView cells for showing details of the items.

•	For saving favorites throughout the app cyle, I used Realm framework (pod). It is something that is fairly new and has been digging into it recently. Its an interesting way of looking into database though Object-oriented eyes.  Although this feature could be simply done using NSCopying- NSUserDefaults-NSKeyedArchiver.

•	RDConstants consists of all the constants defined in the app.

•	Pods used : Realm  (other options :  simple NSCopying- NSUserDefaults-NSKeyedArchiver) and SDWebImage (NSURL->NSData->download->display)
