<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Algerian Music Albums</title>
                <style>
                    body {
                    margin: 0;
                    font-family: 'Segoe UI', sans-serif;
                    background-color: #0b0b0b;
                    color: #fff;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 3rem 1rem;
                    }

                    h2 {
                    margin-bottom: 2rem;
                    font-size: 2rem;
                    color: #fff;
                    letter-spacing: 0.5px;
                    text-align: center;
                    }

                    form {
                    display: flex;
                    gap: 1rem;
                    margin-bottom: 2.5rem;
                    flex-wrap: wrap;
                    justify-content: center;
                    }

                    input[type="text"] {
                    padding: 0.8rem 1rem;
                    border-radius: 0.8rem;
                    border: 1px solid #333;
                    font-size: 1rem;
                    min-width: 250px;
                    background-color: #1a1a1a;
                    color: white;
                    transition: all 0.3s ease;
                    }

                    input[type="text"]:focus {
                    outline: none;
                    border-color: #7f00ff;
                    background-color: #222;
                    }

                    button {
                    padding: 0.8rem 1.5rem;
                    background: linear-gradient(to right, #7f00ff, #007aff);
                    color: white;
                    border: none;
                    border-radius: 0.8rem;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    }

                    button:hover {
                    transform: scale(1.05);
                    box-shadow: 0 0 12px rgba(127, 0, 255, 0.4);
                    }

                    .musicians {
                    display: grid;
                    gap: 2rem;
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                    width: 100%;
                    max-width: 1200px;
                    }

                    .card {
                    background: #1a1a1a;
                    padding: 2rem;
                    border-radius: 1.5rem;
                    border: 1px solid #2a2a2a;
                    box-shadow: 0 4px 30px rgba(255, 255, 255, 0.02);
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }

                    .card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 0 20px rgba(127, 0, 255, 0.15);
                    }

                    .card h3 {
                    margin: 0 0 0.5rem 0;
                    font-size: 1.5rem;
                    color: #ffffff;
                    }

                    .card p {
                    margin: 0.4rem 0;
                    color: #cccccc;
                    font-size: 1rem;
                    }

                    .card p strong {
                    color: #ffffff;
                    }

                    .card ul {
                    padding-left: 1.5rem;
                    margin-top: 0.5rem;
                    color: #bbbbbb;
                    }

                    .card li {
                    font-size: 0.95rem;
                    margin-bottom: 0.3rem;
                    }
                </style>


            </head>

            <body>
                <h2>Algerian Artists Albums</h2>

                <!-- Search form -->
                <form method="get" action="/">

                    <input type="text" id="artist" name="artist" />
                    <button type="submit">Search</button>
                </form>


                <div class="musicians">

                    <xsl:for-each select="CD/album">
                        <xsl:variable name="ref" select="ref-artiste/@ref" />
            <xsl:variable
                            name="artist" select="/CD/artiste[@no=$ref]" />

            <div class="card">

                            <h3>
                                <xsl:value-of select="$artist/@nom" />
                            </h3>
                            <p>🏙️ City: <xsl:value-of select="$artist/@ville" /></p>
                            <p>🎵 Album: <xsl:value-of select="titre" /></p>
                            <p>📅 Year: <xsl:value-of select="@annee" /></p>
                            <p>🎶 Songs:</p>
                            <ul>
                                <xsl:for-each select="chansons/chanson">
                                    <li>
                                        <xsl:value-of select="." />
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>