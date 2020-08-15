# YoutubeSubDl

This is a simple wrapper around [Youtube-dl](https://github.com/ytdl-org/youtube-dl) whose goal is to help automate the creation of
a CSV of video subtitles to import into Anki. 

## Usage

`ffmpeg` needs to be installed prior to using this so the audio can be sliced for each of the Anki cards. The CSV will be added to the `tmp` folder in the project's root directory and if configured via the `config.yml` the
audio files for the subs will be saved to your Anki media folder.


I haven't written a Rake task for running it yet but from the project root, simply run `ruby lib/youtube_sub_dl.rb` and follow the prompts. Feel free to create an issue if you run into bugs or have questions/suggestions.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/youtube_sub_dl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/youtube_sub_dl/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the YoutubeSubDl project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/youtube_sub_dl/blob/master/CODE_OF_CONDUCT.md).
