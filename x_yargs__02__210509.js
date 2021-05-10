#!/usr/bin/env node

//@STCGoal Mastery Yargs and .command + positional arguments

var appStartMessage =
  `Mastery Yargs and .command and positional arguments
By Guillaume Descoteaux-Isabelle, 2020-2021
version ${ver}
----------------------------------------`;

const yargs = require('yargs');
var ver = yargs.version();

const argv = yargs(process.argv)
  .command(
    'get',
    'make a get HTTP request',
    function (yargs) {
      return yargs.option('u', {
        alias: 'url',
        describe: 'the URL to make an HTTP request to'
      })
    },
    function (argv) {
      console.log(argv.url);
      console.log("get...")
    }
  )
  .help()
  .argv;
console.log("...");
console.log(argv._)
console.log(argv.url)
if (argv.directory && argv.file) {
  console.log("Can not use --file and --directory together");
  process.exit(1);
}
