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
    this.createBtnCactus();
  };

  createBtnCactus(){
    this.btnCactus = document.getElementById('buttonCactus');
    this.btnCactus.addEventListener('click', this.animateCactus);
    this.btnCactus.addEventListener('mouseover', this.hoverCactus)
  }

  animateCactus() {
    this.wholeCactus = document.getElementById('cactus');
    this.cactusBody = document.getElementById('cactusBody');
    this.cactusPotBody = document.getElementById('cactusPotBody');
    this.cactusPotLip = document.getElementById('cactusPotLip');
    this.cactusPotTop = document.getElementById('cactusPotTop');
    console.log("clicked")
    var tl = new TimelineMax();
    tl.to(this.cactusBody, 1, {fill: '#8cc63f', delay:0.6}, 0);
    tl.to(this.cactusPotTop, 1, {fill: '#603813', delay:0.6}, 0);
    tl.to(this.cactusPotBody, 1, {fill: '#a55447', delay:0.6}, 0);
    tl.to(this.cactusPotLip, 1, {fill: '#965040', delay:0.6}, 0);
    tl.to(this.wholeCactus, 1, {scale: 3}, 1);
    tl.to(this.wholeCactus, 1, {x:300}, 2);
    tl.to(this.wholeCactus, 1, {scale: 1}, 3);
    tl.to(this.wholeCactus, 1, {x:-1}, 4);
  }

  hoverCactus() {
    this.wholeCactus = document.getElementById('cactus');
    var tl = new TimelineMax({
      repeat: 2
    });
    tl.fromTo(this.wholeCactus, 0.3, {x:-1}, {x:1, ease:RoughEase.ease.config({strength:8, points:20, template:Linear.easeNone, randomize:false}) , clearProps:"x"})
    console.log("hover")
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
