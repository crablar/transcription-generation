import urllib
import sys

mp3_url = sys.argv[1]
slug = sys.argv[2]

try:
    print mp3_url
    urllib.urlretrieve (mp3_url, slug + '.mp3')
except:
    "Failed to download " + slug