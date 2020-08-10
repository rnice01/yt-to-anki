# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/captions/all/captions.rbi
#
# captions-1.3.1

module Captions
end
class Captions::CaptionsError < StandardError
end
class Captions::InvalidSubtitle < Captions::CaptionsError
end
class Captions::MalformedString < Captions::CaptionsError
end
class Captions::UnknownFile < Captions::CaptionsError
end
class Captions::InvalidInput < Captions::CaptionsError
end
module Captions::Util
  def convert_frame_rate(msec, old_fps, new_fps); end
  def convert_to_msec(tc, ms_per_frame = nil); end
  def msec_to_timecode(milliseconds); end
  def sanitize(time, frame_rate); end
end
class Captions::Base
  def base_dump(file); end
  def base_parser; end
  def cues(&block); end
  def cues=(cue_list); end
  def fetch_result(&block); end
  def filter(&block); end
  def frame_rate; end
  def increase_duration_by(diff, &block); end
  def initialize(file = nil, fps = nil); end
  def move_by(diff, &block); end
  def set_frame_rate(rate); end
  include Captions::Export
  include Captions::Util
end
class Captions::CueList
  def [](index); end
  def append(cue); end
  def each; end
  def entries; end
  def fps; end
  def frame_rate=(rate); end
  def initialize(frame_rate, list = nil); end
  def inspect; end
  include Enumerable
end
class Captions::Cue
  def <=>(other_cue); end
  def add_text(text); end
  def alignment; end
  def alignment=(value); end
  def change_frame_rate(old_rate, new_rate); end
  def color; end
  def color=(value); end
  def duration; end
  def duration=(arg0); end
  def end_time; end
  def end_time=(arg0); end
  def initialize(cue_number = nil); end
  def number; end
  def number=(arg0); end
  def position; end
  def position=(value); end
  def properties; end
  def properties=(arg0); end
  def serialize(fps); end
  def set_time(start_time, end_time, duration = nil); end
  def start_time; end
  def start_time=(arg0); end
  def text; end
  def text=(arg0); end
  include Captions::Util
end
class Captions::SRT < Captions::Base
  def dump(file); end
  def format_time(text); end
  def get_time(line); end
  def is_number?(text); end
  def is_text?(text); end
  def is_time?(text); end
  def parse; end
end
class Captions::VTT < Captions::Base
  def dump(file); end
  def get_alignment(value); end
  def get_line(value); end
  def get_position(value); end
  def is_integer?(val); end
  def is_meta_data?(text); end
  def is_text?(text); end
  def is_time?(text); end
  def parse; end
  def set_properties(cue, properties); end
  def validate_header(line); end
end
module Captions::Export
  def export_to_srt(file, cues = nil); end
  def export_to_vtt(file, cues = nil); end
end
