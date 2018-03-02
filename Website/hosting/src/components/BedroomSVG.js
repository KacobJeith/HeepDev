import React from 'react';
import { svgs } from '../assets/remote/SVGs';
import { bedroomSVG } from '../assets/BedroomString';
import $ from 'jquery';
import TimelineMax from 'gsap/src/uncompressed/TimelineMax';
import TweenMax from 'gsap/src/uncompressed/TweenMax';

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

    this.buttonCactus = document.getElementById('buttonCactus');
    this.buttonCactus.addEventListener('mouseover', this.hoverCactus)

    this.buttonFlower = document.getElementById('buttonFlower');

    this.buttonPail = document.getElementById('buttonPail');
  }

  colorCactus() {
  }

  hoverRemote() {
    this.remoteBottom = document.getElementById('remoteBottom');
    this.remoteBody = document.getElementById('remoteBody');
    this.remoteButtonLeft = document.getElementById('remoteButtonLeft');
    this.remoteButtonRight = document.getElementById('remoteButtonRight');
    this.remoteAntennaTop = document.getElementById('remoteAntennaTop');
    this.remoteStickBottomLeft = document.getElementById('remoteStickBottomLeft');
    this.remoteStickBottomRight = document.getElementById('remoteStickBottomRight');
    this.remoteStickTopRight = document.getElementById('remoteStickTopRight');
    this.remoteStickTopLeft = document.getElementById('remoteStickTopLeft');

    var tl = new TimelineMax();
    tl.to(this.remoteBottom, 1, {fill: '#333333', delay:0.6}, 0);
    tl.to(this.remoteBody, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(this.remoteButtonLeft, 1, {fill: '#CCCCCC', delay:0.6}, 0);
    tl.to(this.remoteButtonRight, 1, {fill: '#CCCCCC', delay:0.6}, 0);
    tl.to(this.remoteAntennaTop, 1, {fill: '#000', delay:0.6}, 0);
    tl.to(this.remoteStickBottomLeft, 1, {fill: '#999999', delay:0.6}, 0);
    tl.to(this.remoteStickBottomRight, 1, {fill: '#999999', delay:0.6}, 0);
    tl.to(this.remoteStickTopRight, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(this.remoteStickTopLeft, 1, {fill: '#666666', delay:0.6}, 0);
    tl.to(this.remoteBottom, 1, {fill: '#333333', delay:0.6}, 1);
    tl.to(this.remoteBody, 1, {fill: '#666666', delay:0.6}, 1);
    tl.to(this.remoteBottom, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteButtonLeft, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteButtonRight, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteAntennaTop, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickBottomLeft, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickBottomRight, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickTopRight, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.remoteStickTopLeft, 1, {fill: '#FFF', delay:0.6}, 1);
  };

  hoverCactus() {
    this.cactus = document.getElementById('cactus');
    this.cactusPotBody = document.getElementById('cactusPotBody');
    this.cactusPotLip = document.getElementById('cactusPotLip');
    this.cactusPotTop = document.getElementById('cactusPotTop');
    this.cactusBody = document.getElementById('cactusBody');

    var tl = new TimelineMax();
    tl.to(this.cactusBody, 1, {fill: '#8cc63f', delay:0.6}, 0);
    tl.to(this.cactusPotTop, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(this.cactusPotBody, 1, {fill: '#a55447', delay:0.6}, 0);
    tl.to(this.cactusPotLip, 1, {fill: '#965040', delay:0.6}, 0);
    tl.to(this.cactusBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotTop, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotBody, 1, {fill: '#FFF', delay:0.6}, 1);
    tl.to(this.cactusPotLip, 1, {fill: '#FFF', delay:0.6}, 1);
  };

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
