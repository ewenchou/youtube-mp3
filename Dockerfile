FROM ubuntu
RUN apt-get update && apt-get -y install python python-pip ffmpeg

# Directory to build and install Python module
ENV appdir "/opt/youtube-mp3"
# Directory to output MP3 files
ENV ytmp3out "/tmp/youtube-mp3"
# Mount volumes
VOLUME [${appdir}, ${ytmp3out}]

# Add and install app
ADD ./* ${appdir}/
WORKDIR ${appdir}
RUN pip install --no-cache-dir -r requirements.txt

# Default command
ENV url ""
CMD ["sh", "-c", "python /${appdir}/youtube_mp3/main.py ${url}"]