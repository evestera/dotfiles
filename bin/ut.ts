#!/usr/bin/env -S deno run -q --allow-net=api.met.no --allow-read --allow-env

import { image } from "https://github.com/timcole/deno-twitch-chat/raw/9ce6c93e92a42204ede126f1cb2dc785922f3e30/images.ts";
import { trimIndent } from "https://github.com/proudust/trim-margin-js/raw/4f70f92adda664b67d0067524c8e09e39772e9b7/index.ts";
import { exists } from "https://deno.land/std@0.75.0/fs/exists.ts";

/////

const lat = "59.8770";
const lon = "10.8398";

const weatherApiFetch = (url: string) =>
  fetch(url, {
    headers: {
      "User-Agent": "github.com/evestera/dotfiles",
    },
  });

function highlight(r: number, g: number, b: number, text: string): string {
  return `\x1b[38;2;${r};${g};${b};m${text}\x1b[39m`;
}

function tempColor(temp: number): string {
  if (temp >= 0) {
    const n = Math.trunc(temp) * 8;
    return highlight(255, 230 - n, 200 - n, temp + "°");
  } else {
    const n = Math.trunc(temp) * 8;
    return highlight(200 + n, 230 + n, 255, temp + "°");
  }
}

function expandHome(path: string): string {
  const home = Deno.env.get("HOME")!;
  return path.replace("~", home);
}

// mkdir -p ~/.cache/ut/icons
// curl -s https://api.met.no/weatherapi/weathericon/2.0/data | tar xzf - --strip-components 1 -C ~/.cache/ut/icons png
async function iconString(symbol: string): Promise<string> {
  const iconDir = expandHome("~/.cache/ut/icons");
  let iconPath = iconDir + "/" + symbol + ".png";
  if (!(await exists(iconPath))) {
    iconPath = iconPath.replace("_day", "").replace("_night", "");
  }
  if (!(await exists(iconPath))) {
    return `Error: Icon with path [${iconPath}] not found.`;
  }
  const bytes = await Deno.readFile(iconPath);
  return image(bytes.buffer, {});
}

/////

const forecast = weatherApiFetch(
  `https://api.met.no/weatherapi/locationforecast/2.0/complete.json?lat=${lat}&lon=${lon}`,
).then((res) => res.json());

const offset = `+0${new Date().getTimezoneOffset() * -1 / 60}:00`;
const date = new Date().toISOString().substring(0, 10);
const sunset = weatherApiFetch(
  `https://api.met.no/weatherapi/sunrise/2.0/.json?lat=${lat}&lon=${lon}&date=${date}&offset=${offset}`,
).then((res) => res.json());

const radar = weatherApiFetch(
  `https://api.met.no/weatherapi/radar/2.0/.png?area=southeastern_norway&content=image&type=5level_reflectivity`,
).then((res) => res.arrayBuffer());

const extractTemp = (it: unknown) => it.data.instant.details.air_temperature;
const minTempOf = (arr: any[]) =>
  arr.map(extractTemp).reduce((a: number, b: number) => Math.min(a, b));
const maxTempOf = (arr: any[]) =>
  arr.map(extractTemp).reduce((a: number, b: number) => Math.max(a, b));

try {
  const timeseries = (await forecast).properties.timeseries;
  const data = timeseries[0].data;
  console.log(await iconString(data.next_1_hours.summary.symbol_code));
  console.log(trimIndent`
    Temperatur: ${tempColor(data.instant.details.air_temperature)}
      neste 6 timer: ${tempColor(minTempOf(timeseries.slice(0, 6)))} - ${
    tempColor(maxTempOf(timeseries.slice(0, 6)))
  }
      neste 12 timer: ${tempColor(minTempOf(timeseries.slice(0, 12)))} - ${
    tempColor(maxTempOf(timeseries.slice(0, 12)))
  }
    Nedbør:
      neste time: ${data.next_1_hours.details.precipitation_amount_min} - ${data.next_1_hours.details.precipitation_amount_max} mm
      neste 6 timer: ${data.next_6_hours.details.precipitation_amount_min} - ${data.next_6_hours.details.precipitation_amount_max} mm
      neste 12 timer: ${data.next_12_hours.details.probability_of_precipitation}% sjanse
  `);
} catch (err) {
  console.error("Unable to fetch weather data: " + err.message);
}

console.log();

try {
  const time = new Date((await sunset).location.time[0].sunset.time);
  const timeFormat = new Intl.DateTimeFormat("no", { timeStyle: "short" });
  console.log(`Solnedgang: ${timeFormat.format(time)}`);
} catch (err) {
  console.error("Unable to fetch sunset data: " + err.message);
}

console.log();

try {
  console.log(image(await radar, {
    width: 80,
  }));
} catch (err) {
  console.error("Unable to fetch radar image: " + err.message);
}
