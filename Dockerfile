FROM ubuntu
RUN apt-get update && apt-get -y install python3-pip ffmpeg

# Directory to build and install Python module
ENV appdir "/opt/code"
# Directory to output MP3 files
ENV ytmp3out "/tmp/youtube-mp3"
# Mount volumes
VOLUME [${appdir}, ${ytmp3out}]

# Add and install app
ADD . ${appdir}/
WORKDIR ${appdir}
RUN pip3 install --no-cache-dir -r requirements.txt
RUN python3 setup.py install

# Default command
ENV url ""
CMD ["sh", "-c", "PYTHONIOENCODING=utf-8 python3 /${appdir}/youtube_mp3/main.py ${url}"]
