# espeak-ng-crystal

Crystal bindings for eSpeak NG (Next Generation) Text-to-Speech program.

## Installation

...
Coming soon™
...

### ESpeak installation

```console
  $ sudo apt-get update
  $ sudo apt-get install espeak-ng-espeak 
```

Or via official manual: [github](https://github.com/espeak-ng/espeak-ng)

### Additional voices installation

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


With pre-installed [b]mbrola[/b] and [b]mbrola-voices-de1[/b] packages it is possible to use third-party voices (f.e. German female voice used in example below):


```crystal sample_3.cr
  require "../src/espeak"

  Olga = ESpeakNG.speaker({ speed: 115, lang: "mb-de1" })
  Olga.say "Hallo ich bin deutsches Mädchen!"
```

## Dependencies

* Crystal 0.22.0
* eSpeak NG [github](https://github.com/espeak-ng/espeak-ng)
* mbrola 3.0.1h-5 (optional)

## License

Released under the MIT License. See the [LICENSE](./LICENSE) file for further details.