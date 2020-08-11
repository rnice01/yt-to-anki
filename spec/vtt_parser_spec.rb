RSpec.describe 'VTTParser' do

  describe '#get_subs' do
    it 'parses the tracks with cue identifiers' do
      stub = file_stub('vtt_stubs/with_cues.vtt')
      expected_subs = [
        SubsParsers::SubTrack.new('00:00:22.230', '00:00:24.606', 'This is the first subtitle.'),
        SubsParsers::SubTrack.new('00:00:30.739', '00:00:34.074', 'This is the second.'),
        SubsParsers::SubTrack.new('00:00:34.159', '00:00:35.743', 'Third')
      ]

      vtt_parser = SubsParsers::VttParser.new()
      parsed_subs = vtt_parser.get_subs(stub)

      expected_subs.each_with_index do |sub, i|
        expect(parsed_subs[i].time_start).to eq(sub.time_start)
        expect(parsed_subs[i].time_end).to eq(sub.time_end)
        expect(parsed_subs[i].subs).to eq(sub.subs)
      end
    end

    it 'parses tracks with multiple subs' do
      file_stub = file_stub('vtt_stubs/header_and_cues.vtt')
      expected_subs = [
        SubsParsers::SubTrack.new('00:01:14.815', '00:01:18.114', "- What?\n- Where are we now?"),
        SubsParsers::SubTrack.new('00:01:18.171', '00:01:20.991', "- This is big bat country."),
        SubsParsers::SubTrack.new('00:01:21.058', '00:01:23.868', "- [ Bats Screeching ]\n- They won't get in your hair. They're after the bugs.")
      ]

      vtt_parser = SubsParsers::VttParser.new()
      parsed_subs = vtt_parser.get_subs(file_stub)

      expected_subs.each_with_index do |sub, i|
        expect(parsed_subs[i].time_start).to eq(sub.time_start)
        expect(parsed_subs[i].time_end).to eq(sub.time_end)
        expect(parsed_subs[i].subs).to eq(sub.subs)
      end
    end
  end
end