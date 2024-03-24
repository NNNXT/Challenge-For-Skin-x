
# Challenge for SkinX
## How to Use
**Step 1:**
Download or clone this repo by using the link below:

```
https://github.com/NNNXT/Challenge-For-Skin-x.git
```
**Step 2:**
Go to project root and paste file ```spotify_client.env```
```
https://gist.github.com/NNNXT/fb569cb70fc01fbf5b0cc22112b07fdb
```
**Step 3:**
Go to project root and execute the following command in console to get the required dependencies:
```
flutter pub get
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```
**Step 4:**

Now You can run project press ```F5``` or run command ```Flutter run```

## Challenge for SkinX Features:
* Login
* Home
* Search
* Library
* Playlist Detail
* Create Playlist
* Add Items to Playlist