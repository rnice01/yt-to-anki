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
        expect(sub.time_start).to eq(parsed_subs[i].time_start)
        expect(sub.time_end).to eq(parsed_subs[i].time_end)
        expect(sub.subs).to eq(parsed_subs[i].subs)
      end
    end
  end
end