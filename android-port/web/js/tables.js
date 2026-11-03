// Static game tables ported from the original DM source
// (Character_Handeling.dm, objects.dm /obj/Tran, battle_system.dm).
'use strict';

const SKINS = ['White', 'Tan', 'Light Brown', 'Dark Brown', 'Black'];
const SKIN_ICONS = {
  Male: { 'White': 'male-white.dmi', 'Tan': 'male.dmi', 'Light Brown': 'male-lightbrown.dmi',
          'Dark Brown': 'male-brown.dmi', 'Black': 'male-black.dmi' },
  Female: { 'White': 'female-pale.dmi', 'Tan': 'female.dmi', 'Light Brown': 'female-lightbrown.dmi',
            'Dark Brown': 'female-darkbrown.dmi', 'Black': 'female-black.dmi' },
};

// hairstyle label -> [internal hair id, icon]
const HAIRSTYLES = {
  'Long': ['Long', 'hair_dan_long.dmi'],
  'Spikey': ['Spikey', 'hair_dan_spikeyshort.dmi'],
  'Short': ['Short', 'hair_dan_short.dmi'],
  'Goku': ['Goku', 'hair_dan_goku.dmi'],
  'Vegeta': ['Vegeta', 'hair_dan_vegeta.dmi'],
  'VegetaGT': ['VegetaGT', 'hair_dan_vegetagt.dmi'],
  'Gohan': ['Gohan', 'hair_gohan.dmi'],
  'Spikey Long': ['Spikey Long', 'hair_dan_spikey.dmi'],
  'Trunks': ['Trunks', 'hair_trunks.dmi'],
  'Future Trunks': ['Future Trunks', 'futuretrunkshair.dmi'],
  'Long(Female)': ['Female', 'fem-hair-long.dmi'],
  'Goten': ['goten', 'hair_goten.dmi'],
  'Large Hair': ['kros_long', 'hair_kros_long.dmi'],
  'Punk': ['punk', 'hair_punk.dmi'],
  'Yajirobe': ['yajirobe', 'hair_yajirobe.dmi'],
  'Bald': ['Bald', null],
};

// GetSSJhair() from objects.dm.  [icon, tint]
const SSJ_HAIR = {
  'Spikey Long': ['hair_dan_ssjspikey.dmi'], 'Spikey': ['hair_dan_ssjspikey.dmi'],
  'Long': ['hair_dan_longssj.dmi'], 'Short': ['hair_dan_ssjspikey.dmi'],
  'Gohan': ['hair_dan_ssjspikey.dmi'], 'Trunks': ['ssj_trunks_hair.dmi'],
  'punk': ['hair_punk_ssj.dmi'], 'kros_long': ['hair_kros_long_ssj.dmi'],
  'yajirobe': ['hair_dan_ssjspikey.dmi'], 'goten': ['hair_dan_ssjspikey.dmi'],
  'Future Trunks': ['ssj_futuretrunks_hair.dmi'], 'Female': ['hair_dan_longssj.dmi'],
  'Vegeta': ['hair_dan_vegeta.dmi', [180, 180, 80]], 'VegetaGT': ['hair_dan_vegetagt.dmi', [150, 150, 40]],
  'Goku': ['hair_ssj_goku.dmi'], 'Bald': ['hair_bald_supersayajin.dmi'],
};

// Transformations (/obj/Tran in objects.dm)
const TRANS = {
  SSJ1: { name: 'Super Saiyajin 1', prereq: 300000, boost: 3.1, under: 'ssjaura.dmi', ts: 1, drain: 2 },
  USSJ: { name: 'Ultra Super Saiyajin', prereq: 600000, boost: 3.8, under: 'ssjaura.dmi', ts: 1, drain: 4 },
  SSJ2: { name: 'Super Saiyajin 2', prereq: 1000000, boost: 4.5, under: 'ssjaura.dmi', elec: 'elec.dmi', ts: 1, drain: 3 },
  SSJ3: { name: 'Super Saiyajin 3', prereq: 5000000, boost: 5.8, under: 'ssjaura.dmi', elec: 'ssj3 electricity.dmi', ts: 1, drain: 3 },
  SSJ4: { name: 'Super Saiyajin 4', prereq: 10000000, boost: 6.3, under: 'kaioaura.dmi', over: 'ssj4.dmi', elec: 'redelec.dmi', drain: 4 },
  Human1: { name: 'Unlock Restraints', prereq: 300000, boost: 2.5, under: 'mysticaura.dmi', drain: 2 },
  Human2: { name: 'Rage', prereq: 1000000, boost: 3.5, under: 'mysticaura.dmi', elec: 'elec.dmi', drain: 2 },
  Human3: { name: 'Focus Power', prereq: 5000000, boost: 4.5, under: 'mysticaura.dmi', elec: 'elec.dmi', drain: 2 },
  Human4: { name: 'Adrenaline Explosion', prereq: 10000000, boost: 5.5, under: 'mysticaura.dmi', elec: 'redelec.dmi', drain: 8 },
  SNJ: { name: 'Super Namek', prereq: 300000, boost: 2.7, under: 'mysticaura.dmi', icon: 'super-namek.dmi', drain: 2 },
  SNJ2: { name: 'Super Namek 2', prereq: 1000000, boost: 3.9, under: 'mysticaura.dmi', icon: 'super-namek.dmi', drain: 2 },
  SNJ3: { name: 'Super Namek 3', prereq: 5000000, boost: 4.8, under: 'mysticaura.dmi', icon: 'super-namek.dmi', drain: 2 },
  SNJ4: { name: 'Legendary Super Namek', prereq: 10000000, boost: 6.2, under: 'mysticaura.dmi', elec: 'elec.dmi', icon: 'super-namek.dmi', drain: 2 },
  Cell1: { name: 'Genetic Reconstruction', prereq: 300000, boost: 2.6, drain: 0 },
  Cell2: { name: 'Form 2', prereq: 1000000, boost: 3.5, icon: 'biocell2.dmi', drain: 0 },
  Cell3: { name: 'Perfect', prereq: 5000000, boost: 4.5, icon: 'biocell3.dmi', drain: 0 },
  Cell4: { name: 'Ultra Perfect', prereq: 10000000, boost: 6.3, icon: 'biocell3.dmi', elec: 'redelec.dmi', drain: 4 },
  Icer1: { name: 'Form 2', prereq: 300000, boost: 2.8, icon: 'changeform2.dmi', drain: 0 },
  Icer2: { name: 'Form 3', prereq: 1000000, boost: 3.9, icon: 'changeform3.dmi', drain: 0 },
  Icer3: { name: 'Form 4', prereq: 5000000, boost: 4.8, icon: 'changeform4.dmi', drain: 0 },
  Icer4: { name: 'Full Form 4', prereq: 10000000, boost: 5.9, icon: 'changeform4.dmi', elec: 'elec.dmi', drain: 0 },
  Android1: { name: 'Unlock System Resources 1', prereq: 300000, boost: 2.5, under: 'mysticaura.dmi', drain: 2 },
  Android2: { name: 'Unlock System Resources 2', prereq: 1000000, boost: 3.5, under: 'mysticaura.dmi', elec: 'elec.dmi', drain: 2 },
  Android3: { name: '100% Power Unlock', prereq: 5000000, boost: 4.5, under: 'mysticaura.dmi', elec: 'elec.dmi', drain: 2 },
  Android4: { name: 'Super Android', prereq: 10000000, boost: 6.5, under: 'mysticaura.dmi', elec: 'elec.dmi', drain: 2 },
  Demon1: { name: 'Unlock Inner Evil', prereq: 300000, boost: 2.8, under: 'mysticaura.dmi', drain: 2 },
  Demon2: { name: 'Fat Janemba', prereq: 1000000, boost: 3.9, icon: 'fatjanemba.dmi', drain: 2 },
  Demon3: { name: 'Janemba', prereq: 5000000, boost: 4.8, icon: 'janemba.dmi', drain: 2 },
  Demon4: { name: 'Super Demon Janemba', prereq: 10000000, boost: 6.8, icon: 'janemba.dmi', elec: 'redelec.dmi', drain: 3 },
  Bebi1: { name: 'Bebi Assimilation 10%', prereq: 300000, boost: 2.5, under: 'mysticaura.dmi', drain: 2 },
  Bebi2: { name: 'Bebi Assimilation 30%', prereq: 1000000, boost: 3.8, under: 'mysticaura.dmi', drain: 3 },
  Bebi3: { name: 'Bebi Assimilation 60%', prereq: 5000000, boost: 4.9, under: 'mysticaura.dmi', over: 'bebivest.dmi', drain: 4 },
  Bebi4: { name: 'Bebi Assimilation 100%', prereq: 10000000, boost: 5.9, under: 'mysticaura.dmi', over: 'bebigi.dmi', hair: 'bebi_hair.dmi', drain: 5 },
};

const RACES = {
  'Earth-sei-jin': { race: 'Human', skin: true, hair: true, trans: ['Human1', 'Human2', 'Human3', 'Human4'] },
  'Saiya-jin': { race: 'Saiya-jin', skin: true, hair: true, tail: true, trans: ['SSJ1', 'USSJ', 'SSJ2', 'SSJ3', 'SSJ4'] },
  'Half Saiyajin': { race: 'Halfbreed', skin: true, hair: true, trans: ['SSJ1', 'USSJ', 'SSJ2', 'SSJ3'] },
  'Namek-sei-jin': { race: 'Namek-jin', icon: 'namek.dmi', trans: ['SNJ', 'SNJ2', 'SNJ3', 'SNJ4'] },
  'Cell Type Bio-Android': { race: 'Bio-Android', icon: 'biocell1.dmi', trans: ['Cell1', 'Cell2', 'Cell3', 'Cell4'] },
  'Biological Android': { race: 'Biological Android', skin: true, hair: true, trans: ['Android1', 'Android2', 'Android3', 'Android4'] },
  'Android': { race: 'Android', icon: 'bioandroid-two.dmi', trans: ['Android1', 'Android2', 'Android3', 'Android4'] },
  'Icer/Changling': { race: 'Changling', icon: 'changling.dmi', trans: ['Icer1', 'Icer2', 'Icer3', 'Icer4'] },
  'Demon': { race: 'Demon', icon: 'maledemon.dmi', trans: ['Demon1', 'Demon2', 'Demon3', 'Demon4'] },
  'Tsufuru-jin': { race: 'Tsufuru-jin', skin: true, hair: true, trans: ['Bebi1', 'Bebi2', 'Bebi3', 'Bebi4'] },
};

// Shop stock (/mob/melp/Shopkeeper Buy): name, price, overlay icons by colour
const GI_COLORS = ['Blue', 'Black', 'Red', 'Green', 'White', 'Orange', 'Purple', 'Grey', 'Yellow'];
const SHOP = [
  { item: 'Gi', price: 150, icon: c => 'clothes-' + c.toLowerCase() + 'gi.dmi' },
  { item: 'Shirt', price: 150, icon: c => 'clothes-' + c.toLowerCase() + 'shirt.dmi' },
  { item: 'Pants', price: 100, icon: c => 'clothes_' + c.toLowerCase() + 'pants.dmi' },
  { item: 'Underclothing', price: 150, icon: c => 'clothes-' + c.toLowerCase() + 'under.dmi' },
  { item: 'Cloak', price: 200, icon: c => 'clothes-' + c.toLowerCase() + 'cloak.dmi' },
  { item: 'Shoes', price: 75, icon: c => 'clothes-' + c.toLowerCase() + 'shoes.dmi' },
  { item: 'Gloves', price: 50, icon: c => 'clothes-' + c.toLowerCase() + 'gloves.dmi' },
  { item: 'Cape', price: 350, icon: c => 'clothes-' + c.toLowerCase() + 'cape.dmi' },
];

const KI_COLORS = { yellow: 'kame7.dmi', red: 'kame7red.dmi', teal: 'kame7teal.dmi', green: 'kame7green.dmi',
  blue: 'kame7blue.dmi', purple: 'kame7purple.dmi', pink: 'kame7pink.dmi', orange: 'kame7orange.dmi', black: 'kame7black.dmi' };

// Training equipment (objects.dm): requirement and maxPL gain per rep
const EQUIPMENT = {
  '/obj/WeightTraining100': { kind: 'lift', req: 0, gain: [9, 20], label: '100 lb weights' },
  '/obj/WeightTraining1000': { kind: 'lift', req: 1000, gain: [40, 90], label: '1,000 lb weights' },
  '/obj/WeightTraining10k': { kind: 'lift', req: 10000, gain: [120, 260], label: '10,000 lb weights' },
  '/obj/WeightTraining100k': { kind: 'lift', req: 100000, gain: [300, 700], label: '100,000 lb weights' },
  '/obj/WeightTraining1M': { kind: 'lift', req: 10000000, gain: [510, 1470], label: '1,000,000 lb weights' },
  '/obj/SpeedBag': { kind: 'bag', req: 0, gain: [6, 15], label: 'Speed bag' },
  '/obj/PBag': { kind: 'bag', req: 50000, gain: [21, 66], label: 'Punching bag' },
  '/obj/HeavyPBag': { kind: 'bag', req: 250000, gain: [60, 140], label: 'Heavy bag' },
  '/obj/SuperPBag': { kind: 'bag', req: 1000000, gain: [150, 400], label: 'Super bag' },
  '/obj/Machine': { kind: 'bag', req: 5000, gain: [30, 80], label: 'Training machine' },
  '/mob/other/Dummy': { kind: 'dummy', req: 0, gain: [1, 5], label: 'Training dummy' },
};

// Some NPC flavour lines from the original
const NPC_TALK = [
  'Hello', '...', 'Excuse me i have to be going.', 'What do you want.', 'Do i know you?',
  'Being an NPC is a cold, shallow life.', 'Howdy!', 'Its freaking hot out.',
  'I feel like Potatoes. Yum..', 'When was the last time you took a shower, god.',
];
