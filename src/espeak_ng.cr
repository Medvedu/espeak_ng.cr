# Foreign function interface for espeak-ng shared library (https://github.com/espeak-ng/espeak-ng/).
#
# @see https://github.com/Medvedu/espeak-ng/
# @see README.md
#
# @author Kuzichev Michael
# @license MIT

require "./espeak_ng/ffi"
require "./espeak_ng/voice"
require "./espeak_ng/speaker"

module ESpeakNG

  # @param msg [String]
  #
  # @param opts [Symbol => String|Int32]
  # @option opts[:speed] => Int32
  #   Speed in approximate words per minute. The default is 175
  #
  # @option opts[:pitch_adjustment] => Int32
  #   Pitch adjustment, 0 to 99, default is 50
  #
  # @option opts[:volume] => Int32
  #   Volume in range 0-200 or more. 0=silence, 100=normal, 200=full volume
  # @option opts[:gap] => Int32
  #   Word gap. Pause between words, units of 10mS at the default speed
  #
  # @return [nil]

  def self.say(msg : String, opts = {} of Symbol => String|Int32)
    Speaker.new(opts).say(msg)
  end

  # @param opts [Symbol => String|Int32]
  #   Same as for ESpeakNG#say
  #
  # @return [ESpeakNG::Speaker]

  def self.speaker(opts = {} of Symbol => String|Int32) : Speaker
    Speaker.new(opts)
  end
end # module ESpeakNG