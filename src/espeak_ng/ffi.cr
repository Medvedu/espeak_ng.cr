module ESpeakNG
  private enum ESPEAK_AUDIO_OUTPUT
    AUDIO_OUTPUT_PLAYBACK,       
    AUDIO_OUTPUT_RETRIEVAL,      
    AUDIO_OUTPUT_SYNCHRONOUS,    
    AUDIO_OUTPUT_SYNCH_PLAYBACK  
  end

  private enum INTERNAL_ENCODING
    CHARS_AUTO  = 0,
    CHARS_UTF8  = 1,
    CHARS_8BIT  = 2,
    CHARS_WCHAR = 3
  end

  private enum POSITION_TYPE
    POS_CHARACTER = 1,
    POS_WORD 
    POS_SENTENCE
  end

  private enum ESPEAK_PARAMETER
    SILENCE     = 0,
    RATE        = 1,
    VOLUME      = 2,
    PITCH       = 3,
    RANGE       = 4,
    PUNCTUATION = 5,
    CAPITALS    = 6,
    WORDGAP     = 7,
    OPTIONS     = 8,
    INTONATION  = 9,

    RESERVED1   = 10,
    RESERVED2   = 11,

    EMPHASIS,
    LINELENGTH,
    VOICETYPE,

    N_SPEECH_PARAM
  end

  @[Link("espeak")]
  private lib NGSpeakLib
    
    fun init = espeak_Initialize(
      output     : ESPEAK_AUDIO_OUTPUT,
      buf_length : LibC::Int32T,
      path       : LibC::Char*,
      options    : LibC::Int32T
    ) : LibC::Int32T

    fun synth = espeak_Synth(
      text              : LibC::Char*, 
      size_t            : LibC::UInt32T, 
      position_type     : POSITION_TYPE,
      end_position      : LibC::UInt32T,
      flags             : LibC::UInt32T,
      unique_identifier : LibC::UInt32T*,
      user_data         : Void*
    ) : Int32

    fun set_parameter = espeak_SetParameter(
      parameter : ESPEAK_PARAMETER,
      value     : LibC::Int32T,
      relative  : LibC::Int32T,
    ) : Int32

    fun set_voice_by_name = espeak_ng_SetVoiceByName(
      name : LibC::Char*
    )
    
  end # lib LibESpeak
end # module ESpeakNG