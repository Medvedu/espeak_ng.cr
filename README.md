# espeak-ng-crystal

**Status: BETA** Crystal bindings for eSpeak NG (Next Generation) Text-to-Speech shared library. 

## Installation

Add this to your application's shard.yml:

```yaml
dependencies:
  espeak-ng-crystal:
    github: medvedu/espeak-ng-crystal
```

Then require the lib in your Crystal code:

```crystal
  require "espeak_ng"
```

### ESpeak installation

```console
  $ sudo apt-get update
  $ sudo apt-get install espeak-ng-espeak 
```

Or via official manual: [→ github page](https://github.com/espeak-ng/espeak-ng)

### Custom voices installation (optional)

 See [mbrola](https://github.com/espeak-ng/espeak-ng/blob/master/docs/mbrola.md) page.

## Usage

### Basic usage

```crystal sample.cr
  ESpeakNG.say("Message sent!")
  ESpeakNG.say("こんにちは", { speed: 70, lang: "japanese" } )
```


Or, via class instance:


```crystal sample_2.cr
  bob = ESpeakNG.speaker({ speed: 44, volume: 35, pitch: 50, gap: 0})
  bob.say "One. Two. Three. Four!"
```


With pre-installed **mbrola** and **mbrola-voices-de1** packages it is possible to use third-party voices (f.e. German female voice used in example below):


```crystal sample_3.cr
  Olga = ESpeakNG.speaker({ speed: 115, lang: "mb-de1" })
  Olga.say "Hallo ich bin deutsches Mädchen!"
```

## TODO

  * tests
  * add output to stdout | wav file

## Dependencies

  * Crystal 0.22.0
  * eSpeak NG [→ github page](https://github.com/espeak-ng/espeak-ng)
  * mbrola 3.0.1h-5 (optional)

## Contributing

  * Fork it ( https://github.com/mjago/soundfile/fork )
  * Create your feature branch (git checkout -b my-new-feature)
  * Commit your changes (git commit -am 'Add some feature')
  * Push to the branch (git push origin my-new-feature)
  * Create a new Pull Request

## License

Released under the MIT License. See the [→ LICENSE](./LICENSE) file for further details.