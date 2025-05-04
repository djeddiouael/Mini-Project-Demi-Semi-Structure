from flask import Flask, request, Response
from lxml import etree

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    artist_query = request.args.get("artist", "").strip().lower()

    # Parse the full XML and XSL
    xml_tree = etree.parse("ArtistAlgerian.xml")
    xsl_tree = etree.parse("edition.xsl")

    # If an artist name is entered, filter the XML in memory
    if artist_query:
        root = xml_tree.getroot()

        # Create a list of albums to remove based on the artist query
        albums_to_remove = []

        for album in root.findall("album"):
            ref = album.find("ref-artiste").get("ref")
            artist = root.find(f"artiste[@no='{ref}']")

            # Check if artist name contains the search query (case-insensitive)
            artist_name = artist.get("nom").lower() if artist is not None else ""
            if artist_name.find(artist_query) == -1:  # Use find() to check substring match
                albums_to_remove.append(album)

        # Remove albums that don't match the artist query
        for album in albums_to_remove:
            root.remove(album)

    # Apply XSL transformation
    transform = etree.XSLT(xsl_tree)
    result = transform(xml_tree)

    return Response(str(result), content_type="text/html")

if __name__ == "__main__":
    app.run(debug=True)
