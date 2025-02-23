#!/usr/bin/env -S deno run -q

export {};

function countAndTrimIndent(s: string): [number, string] {
  let count = 0;
  for (const c of s) {
    if (c != " ") {
      return [count, s.substring(count)];
    }
    count += 1;
  }
  return [count, ""];
}

if (Deno.args.length < 1) {
    console.log('Error: Header to extract not set');
    console.log('Usage: extract-indented.ts <HEADER STRING>');
    Deno.exit(1);
}
const key = Deno.args[0];

const decoder = new TextDecoder();
let input = "";
for await (const chunk of Deno.stdin.readable) {
  input += decoder.decode(chunk);
}
const lines = input.split("\n");
const pairs = lines
  .map((s) => countAndTrimIndent(s))
  .filter(([_count, s]) => s.length > 0);

let outputting = false;
let outputIndent = 0;
for (const [count, s] of pairs) {
  if (s === key) {
    outputting = true;
    outputIndent = count;
    continue;
  }
  if (outputting) {
    if (count <= outputIndent) {
      break;
    }
    console.log(s);
  }
}
