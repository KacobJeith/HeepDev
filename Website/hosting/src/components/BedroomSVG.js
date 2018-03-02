import React from 'react';
import { svgs } from '../assets/remote/SVGs';
import { bedroomSVG } from '../assets/BedroomString';
import $ from 'jquery';
import TimelineMax from 'gsap/src/uncompressed/TimelineMax';
import TweenMax from 'gsap/src/uncompressed/TweenMax';

var defaultColor = '#FAFAFA'

var buttonRemote = [];
var buttonPig = [];
var buttonDiary = [];
var buttonSleep = [];
var buttonDresserTop = [];
var buttonDresserBottom = [];
var buttonCactus = [];
var buttonFlower = [];
var buttonPail = [];

var remoteBottom = [];
var remoteBody = [];
var remoteButtons = [];
var remoteAntennaTop = [];
var remoteStickBottoms = [];
var remoteStickTops = [];

var pigBodyElements = [];
var pigSnoutFront = [];
var pigBackElements = [];
var pigEarInner = [];
var pigNostrils = [];
var pigEyes = [];
var pigCoinSlot = [];

var diaryBottom = [];
var diaryPages = [];
var diaryCover = [];
var diarySpine = [];

var sleepMount = [];
var sleepButton = [];

var dresserFrame = [];
var dresserDrawers = [];
var dresserKnobs = [];

var cactusPotBody = [];
var cactusPotLip = [];
var cactusPotTop = [];
var cactusBody = [];

var flowerPotBottom = [];
var flowerPotLip = [];
var flowerPotTop = [];
var leafBodyRight = [];
var leafBodyCenter = [];
var leafBodyLeft = [];
var flowerPetals = [];
var flowerStamens = [];



class BedroomSVG extends React.Component{

  constructor(props) {
		super(props);
    var dummyDiv = document.createElement('div');
		dummyDiv.innerHTML = bedroomSVG;
    this.svg = $(dummyDiv).find('svg')[0];
	};

  componentDidMount() {
    this.createButtons();
    this.getElements();
  };

  createButtons(){
    buttonRemote = document.getElementById('buttonRemote');
    buttonPig = document.getElementById('buttonPig');
    buttonDiary = document.getElementById('buttonDiary');
    buttonSleep = document.getElementById('buttonSleep');
    buttonDresserTop = document.getElementById('buttonDresserTop');
    buttonDresserBottom = document.getElementById('buttonDresserBottom');
    buttonCactus = document.getElementById('buttonCactus');
    buttonFlower = document.getElementById('buttonFlower');
    buttonPail = document.getElementById('buttonPail');

    buttonRemote.addEventListener('mouseover', this.hoverRemote);
    buttonPig.addEventListener('mouseover', this.hoverPig);
    buttonDiary.addEventListener('mouseover', this.hoverDiary);
    buttonSleep.addEventListener('mouseover', this.hoverSleep);
    buttonDresserTop.addEventListener('mouseover', this.hoverDresser);
    buttonDresserBottom.addEventListener('mouseover', this.hoverDresser);
    buttonCactus.addEventListener('mouseover', this.hoverCactus);
    buttonFlower.addEventListener('mouseover', this.hoverFlower);
    buttonPail.addEventListener('mouseover', this.hoverPail);

    buttonRemote.addEventListener('mouseleave', this.leaveRemote);
    buttonPig.addEventListener('mouseleave', this.leavePig);
    buttonDiary.addEventListener('mouseleave', this.leaveDiary);
    buttonSleep.addEventListener('mouseleave', this.leaveSleep);
    buttonDresserTop.addEventListener('mouseleave', this.leaveDresser);
    buttonDresserBottom.addEventListener('mouseleave', this.leaveDresser);
    buttonCactus.addEventListener('mouseleave', this.leaveCactus);
    buttonFlower.addEventListener('mouseleave', this.leaveFlower);
    buttonPail.addEventListener('mouseleave', this.leavePail);
  };

  getElements() {
    remoteBottom = document.getElementById('remoteBottom');
    remoteBody = document.getElementById('remoteBody');
    remoteButtons = document.getElementById('remoteButtons');
    remoteAntennaTop = document.getElementById('remoteAntennaTop');
    remoteStickBottoms = document.getElementById('remoteStickBottoms');
    remoteStickTops = document.getElementById('remoteStickTops');

    pigBodyElements = document.getElementById('pigBodyElements');
    pigSnoutFront = document.getElementById('pigSnoutFront');
    pigBackElements = document.getElementById('pigBackElements');
    pigEarInner = document.getElementById('pigEarInner');
    pigNostrils = document.getElementById('pigNostrils');
    pigEyes = document.getElementById('pigEyes');
    pigCoinSlot = document.getElementById('pigCoinSlot');

    diaryBottom = document.getElementById('diaryBottom');
    diaryPages = document.getElementById('diaryPages');
    diaryCover = document.getElementById('diaryCover');
    diarySpine = document.getElementById('diarySpine');

    sleepMount = document.getElementById('sleepMount');
    sleepButton = document.getElementById('sleepButton');

    dresserFrame = document.getElementById('dresserFrame');
    dresserDrawers = document.getElementById('dresserDrawers');
    dresserKnobs = document.getElementById('dresserKnobs');

    cactusPotBody = document.getElementById('cactusPotBody');
    cactusPotLip = document.getElementById('cactusPotLip');
    cactusPotTop = document.getElementById('cactusPotTop');
    cactusBody = document.getElementById('cactusBody');

    flowerPotBottom = document.getElementById('flowerPotBottom');
    flowerPotLip = document.getElementById('flowerPotLip');
    flowerPotTop = document.getElementById('flowerPotTop');
    leafBodyRight = document.getElementById('leafBodyRight');
    leafBodyCenter = document.getElementById('leafBodyCenter');
    leafBodyLeft = document.getElementById('leafBodyLeft');
    flowerPetals = document.getElementById('flowerPetals');
    flowerStamens = document.getElementById('flowerStamens');

  };

  hoverRemote() {
    var tl = new TimelineMax();
    tl.to(remoteBottom, 1, {fill: '#333333', delay:0.6}, 0);
    tl.to(remoteBody, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(remoteButtons, 1, {fill: '#CCCCCC', delay:0.6}, 0);
    tl.to(remoteAntennaTop, 1, {fill: '#000', delay:0.6}, 0);
    tl.to(remoteStickBottoms, 1, {fill: '#999999', delay:0.6}, 0);
    tl.to(remoteStickTops, 1, {fill: '#666666', delay:0.6}, 0);
  };

  leaveRemote() {
    var tl = new TimelineMax();
    tl.to(remoteBottom, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(remoteBody, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(remoteButtons, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(remoteAntennaTop, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(remoteStickBottoms, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(remoteStickTops, 1, {fill: defaultColor, delay:0.6}, 0);
  };

  hoverPig() {
    var tl = new TimelineMax();
    tl.to(pigBodyElements, 1, {fill: '#EDC3D9', delay:0.6}, 0);
    tl.to(pigSnoutFront, 1, {fill: '#FCEDF7', delay:0.6}, 0);
    tl.to(pigBackElements, 1, {fill: '#B27D97', delay:0.6}, 0);
    tl.to(pigEarInner, 1, {fill: '#FCEDF7', delay:0.6}, 0);
    tl.to(pigNostrils, 1, {fill: '#37474F', delay:0.6}, 0);
    tl.to(pigEyes, 1, {fill: '#37474F', delay:0.6}, 0);
    tl.to(pigCoinSlot, 1, {fill: '#37474F', delay:0.6}, 0);
  };

  leavePig() {
    var tl = new TimelineMax();
    tl.to(pigBodyElements, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigSnoutFront, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigBackElements, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigEarInner, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigNostrils, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigEyes, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(pigCoinSlot, 1, {fill: defaultColor, delay:0.6}, 0);
  };

  hoverDiary() {
    var tl = new TimelineMax();
    tl.to(diaryBottom, 1, {fill: '#4A99CE', delay:0.6}, 0);
    tl.to(diaryPages, 1, {fill: '#FFF', delay:0.6}, 0);
    tl.to(diaryCover, 1, {fill: '#ADE9F2', delay:0.6}, 0);
    tl.to(diarySpine, 1, {fill: '#4A99CE', delay:0.6}, 0);
  };

  leaveDiary() {
    var tl = new TimelineMax();
    tl.to(diaryBottom, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(diaryPages, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(diaryCover, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(diarySpine, 1, {fill: defaultColor, delay:0.6}, 0);
  };

  hoverSleep() {
    var tl = new TimelineMax();
    tl.to(sleepMount, 1, {fill: '#AAAAAA', delay:0.6}, 0);
    tl.to(sleepButton, 1, {fill: '#AA1721', delay:0.6}, 0);
  };

  leaveSleep() {
    var tl = new TimelineMax();
    tl.to(sleepMount, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(sleepButton, 1, {fill: defaultColor, delay:0.6}, 0);
  }

  hoverDresser() {
    var tl = new TimelineMax();
    tl.to(dresserFrame, 1, {fill: '#627172', delay:0.6}, 0);
    tl.to(dresserDrawers, 1, {fill: '#505B5B', delay:0.6}, 0);
    tl.to(dresserKnobs, 1, {fill: '#627172', delay:0.6}, 0);
  };

  leaveDresser() {
    var tl = new TimelineMax();
    tl.to(dresserFrame, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(dresserDrawers, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(dresserKnobs, 1, {fill: defaultColor, delay:0.6}, 0);
  };

  hoverCactus() {
    var tl = new TimelineMax();
    tl.to(cactusPotBody, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(cactusPotLip, 1, {fill: '#965040', delay:0.6}, 0);
    tl.to(cactusPotTop, 1, {fill: '#a55447', delay:0.6}, 0);
    tl.to(cactusBody, 1, {fill: '#8cc63f', delay:0.6}, 0);
  };

  leaveCactus() {
    var tl = new TimelineMax();
    tl.to(cactusPotBody, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(cactusPotLip, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(cactusPotTop, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(cactusBody, 1, {fill: defaultColor, delay:0.6}, 0);
  };

  hoverFlower() {
    var tl = new TimelineMax();
    tl.to(flowerPotBottom, 1, {fill: '#A55447', delay:0.6}, 0);
    tl.to(flowerPotLip, 1, {fill: '#965040', delay:0.6}, 0);
    tl.to(flowerPotTop, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(leafBodyRight, 1, {fill: '#39B54A', delay:0.6}, 0);
    tl.to(leafBodyCenter, 1, {fill: '#006837', delay:0.6}, 0);
    tl.to(leafBodyLeft, 1, {fill: '#009245', delay:0.6}, 0);
    tl.to(flowerPetals, 1, {fill: '#F9D7E4', delay:0.6}, 0);
    tl.to(flowerStamens, 1, {fill: '#FBB03B', delay:0.6}, 0);
  };

  leaveFlower() {
    var tl = new TimelineMax();
    tl.to(flowerPotBottom, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(flowerPotLip, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(flowerPotTop, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(leafBodyRight, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(leafBodyCenter, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(leafBodyLeft, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(flowerPetals, 1, {fill: defaultColor, delay:0.6}, 0);
    tl.to(flowerStamens, 1, {fill: defaultColor, delay:0.6}, 0);
  }

  render() {
    const inputs = {
			svg: {
				dangerouslySetInnerHTML: {__html: $(this.svg).prop('outerHTML')},
			}
    };

    return (
      <div {...inputs.svg}/>
    )
  };
};

export default BedroomSVG
