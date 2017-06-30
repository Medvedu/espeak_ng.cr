module ESpeakNG
  private class Speaker
    getter! gap    : Int32
    getter! speed  : Int32
    getter! volume : Int32
    getter! pitch  : Int32
    getter! lang   : Language
    
    def initialize(opts = {} of Symbol => String|Int32|Nil)
      @gap    = opts[:gap]?    ? opts[:gap]?.as(Int32)    : 10
      @speed  = opts[:speed]?  ? opts[:speed]?.as(Int32)  : 175
      @volume = opts[:volume]? ? opts[:volume]?.as(Int32) : 100
      @pitch  = opts[:pitch]?  ? opts[:pitch]?.as(Int32)  : 50
      @lang   = opts[:lang]?   ? Language.new(opts[:lang]?.as(String)) : Language.new("en-us")

      init_espeak_shared_lib
    end

    def say(msg : String)
      override_current_settings
      synthesize_speech! msg
    end

    private def synthesize_speech!(msg : String)
      NGSpeakLib.synth(
        msg, msg.size, POSITION_TYPE::POS_WORD, 0, INTERNAL_ENCODING::CHARS_AUTO, nil, nil)
    end

    private def init_espeak_shared_lib
      @@load_only_once ||= NGSpeakLib.init(
        ESPEAK_AUDIO_OUTPUT::AUDIO_OUTPUT_SYNCH_PLAYBACK, 0, nil, 0x0001)
    end

    private PARAMS_TO_FFI_MAPPING = { 
      gap:    ESPEAK_PARAMETER::WORDGAP,
      speed:  ESPEAK_PARAMETER::RATE,
      pitch:  ESPEAK_PARAMETER::PITCH,
      volume: ESPEAK_PARAMETER::VOLUME
    }

    private def override_current_settings
      # set_parameter
      params = { gap: @gap, speed: @speed, volume: @volume, pitch: @pitch }
      params.each do |key, value|
        next unless value
        NGSpeakLib.set_parameter(PARAMS_TO_FFI_MAPPING[key], value, 0)
      end

      # set_voice_by_name
      if @lang
        NGSpeakLib.set_voice_by_name(@lang.as(Language).code)
      end
    end
  end # class Speaker
end # module ESpeakNG