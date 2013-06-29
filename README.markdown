# ckb

A 'custom-keyboard' daemon. Intended to be used as a simple solution to making use of all the IR remotes that get attached to everything nowadays. At its core this software is a simple parser for (currently only Linux's) /dev/input/eventX data that executes corresponding Ruby code on matched keys.

## Usage

So your 'keyboard' shows up as /dev/input/eventX (you may also want to disable it as an X keyboard).

First map the keys:

```
ckb-mkmap /dev/input/eventX /where/you/want/the/keymap/to/sit
```

You will be asked to provide a mnemonic (which will become a Ruby :SYMBOL) and then press a key (on the corresponding 'keyboard'). The string you use for the mnemonic should be short and free of any fancy characters - spaces will be auto-converted to underscores. Repeat the procedure for each key you want to use and hit CTRL-C. Your keymap (a template really) will be written.

Now edit the keymap file. You can refer to ```examples/eztvmap.rb```. Note that you can simply run the keymap file to check for basic syntax errors.

Finally run the ```ckbd``` daemon. You can use ```ckbd --help``` to check what you can do. Canonical example:

```
ckbd -n /dev/input/event16 -l Documents/Logs/ckbd.log System/eztvmap.rb
```

