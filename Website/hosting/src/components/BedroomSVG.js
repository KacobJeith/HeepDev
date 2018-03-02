import React from 'react';
import { svgs } from '../assets/remote/SVGs';
import { bedroomSVG } from '../assets/BedroomString';
import $ from 'jquery';
import TimelineMax from 'gsap/src/uncompressed/TimelineMax';
import TweenMax from 'gsap/src/uncompressed/TweenMax';

var buttonCactus = [];


class BedroomSVG extends React.Component{

  constructor(props) {
		super(props);
    var dummyDiv = document.createElement('div');
		dummyDiv.innerHTML = bedroomSVG;
    this.svg = $(dummyDiv).find('svg')[0];
	};

  componentDidMount() {
    this.createButtons();
  };

  createButtons(){
    this.buttonRemote = document.getElementById('buttonRemote');
    this.buttonRemote.addEventListener('mouseover', this.hoverRemote);

    this.buttonPig = document.getElementById('buttonPig');

    this.buttonDiary = document.getElementById('buttonDiary');

    this.buttonSleep = document.getElementById('buttonSleep');

    this.buttonDresserTop = document.getElementById('buttonDresserTop');

    this.buttonDresserBottom = document.getElementById('buttonDresserBottom');

    buttonCactus = document.getElementById('buttonCactus');
    buttonCactus.addEventListener('mouseover', this.hoverCactus)

    this.buttonFlower = document.getElementById('buttonFlower');
    this.buttonFlower.addEventListener('mouseover', this.hoverFlower)

    this.buttonPail = document.getElementById('buttonPail');
  }

  hoverRemote() {
    var tl = new TimelineMax();

    this.remoteBottom = document.getElementById('remoteBottom');
    this.remoteBody = document.getElementById('remoteBody');
    this.remoteButtons = document.getElementById('remoteButtons');
    this.remoteAntennaTop = document.getElementById('remoteAntennaTop');
    this.remoteStickBottoms = document.getElementById('remoteStickBottoms');
    this.remoteStickTops = document.getElementById('remoteStickTops');

    tl.to(this.remoteBottom, 1, {fill: '#333333', delay:0.6}, 0);
    tl.to(this.remoteBody, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(this.remoteButtons, 1, {fill: '#CCCCCC', delay:0.6}, 0);
    tl.to(this.remoteAntennaTop, 1, {fill: '#000', delay:0.6}, 0);
    tl.to(this.remoteStickBottoms, 1, {fill: '#999999', delay:0.6}, 0);
    tl.to(this.remoteStickTops, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(this.remoteBottom, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteButtons, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteAntennaTop, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickBottoms, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickTops, 1, {fill: '#FFF', delay:0.6}, 1);
};

  hoverCactus() {
    var tl = new TimelineMax();

    this.cactus = document.getElementById('cactus');
    this.cactusPotBody = document.getElementById('cactusPotBody');
    this.cactusPotLip = document.getElementById('cactusPotLip');
    this.cactusPotTop = document.getElementById('cactusPotTop');
    this.cactusBody = document.getElementById('cactusBody');

    tl.to(this.cactusBody, 1, {fill: '#8cc63f', delay:0.6}, 0);
    tl.to(this.cactusPotTop, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(this.cactusPotBody, 1, {fill: '#a55447', delay:0.6}, 0);
    tl.to(this.cactusPotLip, 1, {fill: '#965040', delay:0.6}, 0);

    tl.to(this.cactusBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotTop, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotLip, 1, {fill: '#FFF', delay:0.6}, 1);
  };

  hoverFlower() {
    var tl = new TimelineMax();

    this.petals = document.getElementById('petals');
    this.stamens = document.getElementById('stamens');
    this.leafRight = document.getElementById('leafRight');
    this.leafCenter = document.getElementById('leafCenter');
    this.leafLeft = document.getElementById('leafLeft');
    this.flowerPotBottom = document.getElementById('flowerPotBottom');
    this.flowerPotLip = document.getElementById('flowerPotLip');
    this.flowerPotTop = document.getElementById('flowerPotTop');

    tl.to(this.flowerPotBottom, 1, {fill: '#A55447', delay:0.6}, 0);
    tl.to(this.flowerPotLip, 1, {fill: '#965040', delay:0.6}, 0);
    tl.to(this.flowerPotTop, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(this.leafRight, 1, {fill: '#39B54A', delay:0.6}, 0);
    tl.to(this.leafCenter, 1, {fill: '#006837', delay:0.6}, 0);
    tl.to(this.leafLeft, 1, {fill: '#009245', delay:0.6}, 0);
    tl.to(this.petals, 1, {fill: '#F9D7E4', delay:0.6}, 0);
    tl.to(this.stamens, 1, {fill: '#FBB03B', delay:0.6}, 0);

    tl.to(this.leafRight, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.leafCenter, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.leafLeft, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.petals, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.stamens, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.flowerPotBottom, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.flowerPotLip, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.flowerPotTop, 1, {fill: '#FFF', delay:0.6}, 1);
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
