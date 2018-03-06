import React from 'react';
import { svgs } from '../assets/remote/SVGs';
import { bedroomSVG } from '../assets/BedroomString';
import $ from 'jquery';
import { TimelineMax, TweenLite } from 'gsap';
import { withStyles } from 'material-ui/styles';
import { Paper } from 'material-ui'

const styles = theme => ({
  root: theme.mixins.gutters({
    paddingTop: 16,
    paddingBottom: 16,
    margin: theme.spacing.unit * 3,
  }),
});

var colorDefault = '#FFF';
var colorDuration = 1;
var colorDelay = 0.6;

var tlShake = new TimelineMax({repeat:-1});

class BedroomSVG extends React.Component{

  constructor(props) {
		super(props);
    var bedroomDiv = document.createElement('div');
		bedroomDiv.innerHTML = bedroomSVG;
    this.svg = $(bedroomDiv).find('svg')[0];
    this.svg.setAttribute('preserveAspectRatio', 'xMidYMid meet');
    this.svg.setAttribute('viewBox', '0 0 1500 800')
	};

  componentDidMount() {
    this.createButtons();
    this.getElements();
  };

  createButtons() {
    var buttonRemote = document.getElementById('buttonRemote');
    var buttonPig = document.getElementById('buttonPig');
    var buttonDiary = document.getElementById('buttonDiary');
    var buttonSleep = document.getElementById('buttonSleep');
    var buttonDresserTop = document.getElementById('buttonDresserTop');
    var buttonDresserBottom = document.getElementById('buttonDresserBottom');
    var buttonCactus = document.getElementById('buttonCactus');
    var buttonFlower = document.getElementById('buttonFlower');
    var buttonPail = document.getElementById('buttonPail');

    buttonRemote.addEventListener('mouseover', this.hoverRemote.bind(this));
    buttonPig.addEventListener('mouseover', this.hoverPig.bind(this));
    buttonDiary.addEventListener('mouseover', this.hoverDiary.bind(this));
    buttonSleep.addEventListener('mouseover', this.hoverSleep.bind(this));
    buttonDresserTop.addEventListener('mouseover', this.hoverDresser.bind(this));
    buttonDresserBottom.addEventListener('mouseover', this.hoverDresser.bind(this));
    buttonCactus.addEventListener('mouseover', this.hoverCactus.bind(this));
    buttonFlower.addEventListener('mouseover', this.hoverFlower.bind(this));

    buttonRemote.addEventListener('mouseleave', this.leaveRemote.bind(this));
    buttonPig.addEventListener('mouseleave', this.leavePig.bind(this));
    buttonDiary.addEventListener('mouseleave', this.leaveDiary.bind(this));
    buttonSleep.addEventListener('mouseleave', this.leaveSleep.bind(this));
    buttonDresserTop.addEventListener('mouseleave', this.leaveDresser.bind(this));
    buttonDresserBottom.addEventListener('mouseleave', this.leaveDresser.bind(this));
    buttonCactus.addEventListener('mouseleave', this.leaveCactus.bind(this));
    buttonFlower.addEventListener('mouseleave', this.leaveFlower.bind(this));
  };

  getElements() {
    var remote = document.getElementById('remote');
    var remoteBottom = document.getElementById('remoteBottom');
    var remoteBody = document.getElementById('remoteBody');
    var remoteButtons = document.getElementById('remoteButtons');
    var remoteAntennaTop = document.getElementById('remoteAntennaTop');
    var remoteStickBottoms = document.getElementById('remoteStickBottoms');
    var remoteStickTops = document.getElementById('remoteStickTops');

    var pig = document.getElementById('pig');
    var pigBodyElements = document.getElementById('pigBodyElements');
    var pigSnoutFront = document.getElementById('pigSnoutFront');
    var pigBackElements = document.getElementById('pigBackElements');
    var pigEarInner = document.getElementById('pigEarInner');
    var pigNostrils = document.getElementById('pigNostrils');
    var pigEyes = document.getElementById('pigEyes');
    var pigCoinSlot = document.getElementById('pigCoinSlot');

    var diary = document.getElementById('diary')
    var diaryBottom = document.getElementById('diaryBottom');
    var diaryPages = document.getElementById('diaryPages');
    var diaryCover = document.getElementById('diaryCover');
    var diarySpine = document.getElementById('diarySpine');

    var sleep = document.getElementById('sleep');
    var sleepMount = document.getElementById('sleepMount');
    var sleepButton = document.getElementById('sleepButton');

    var dresser = document.getElementById('dresser');
    var dresserFrame = document.getElementById('dresserFrame');
    var dresserDrawers = document.getElementById('dresserDrawers');
    var dresserKnobs = document.getElementById('dresserKnobs');

    var cactus = document.getElementById('cactus');
    var cactusPotBody = document.getElementById('cactusPotBody');
    var cactusPotLip = document.getElementById('cactusPotLip');
    var cactusPotTop = document.getElementById('cactusPotTop');
    var cactusBody = document.getElementById('cactusBody');

    var flowers = document.getElementById('flowers');
    var flowerPotBottom = document.getElementById('flowerPotBottom');
    var flowerPotLip = document.getElementById('flowerPotLip');
    var flowerPotTop = document.getElementById('flowerPotTop');
    var leafBodyRight = document.getElementById('leafBodyRight');
    var leafBodyCenter = document.getElementById('leafBodyCenter');
    var leafBodyLeft = document.getElementById('leafBodyLeft');
    var flowerPetals = document.getElementById('flowerPetals');
    var flowerStamens = document.getElementById('flowerStamens');
  };

  hoverShake(e) {
    tlShake.fromTo(e, 2, {x:-1}, {x:1, ease:RoughEase.ease.config({
      strength:8,
      points:20,
      template:Linear.easeNone,
      randomize:false
    }) , clearProps:"x"});
  };

  leaveShake() {
    tlShake.clear();
  };

  hoverRemote() {
    let tl = new TimelineMax();
    tl.to(remoteBottom, colorDuration, {fill: '#333333', colorDelay}, 0);
    tl.to(remoteBody, colorDuration, {fill: '#666666', colorDelay}, 0);
    tl.to(remoteButtons, colorDuration, {fill: '#CCCCCC', colorDelay}, 0);
    tl.to(remoteAntennaTop, colorDuration, {fill: '#000', colorDelay}, 0);
    tl.to(remoteStickBottoms, colorDuration, {fill: '#999999', colorDelay}, 0);
    tl.to(remoteStickTops, colorDuration, {fill: '#666666', colorDelay}, 0);
    this.hoverShake(remote);
  };

  leaveRemote() {
    let tl = new TimelineMax();
    tl.to(remoteBottom, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(remoteBody, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(remoteButtons, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(remoteAntennaTop, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(remoteStickBottoms, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(remoteStickTops, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  hoverPig() {
    let tl = new TimelineMax();
    tl.to(pigBodyElements, colorDuration, {fill: '#EDC3D9', colorDelay}, 0);
    tl.to(pigSnoutFront, colorDuration, {fill: '#FCEDF7', colorDelay}, 0);
    tl.to(pigBackElements, colorDuration, {fill: '#B27D97', colorDelay}, 0);
    tl.to(pigEarInner, colorDuration, {fill: '#FCEDF7', colorDelay}, 0);
    tl.to(pigNostrils, colorDuration, {fill: '#37474F', colorDelay}, 0);
    tl.to(pigEyes, colorDuration, {fill: '#37474F', colorDelay}, 0);
    tl.to(pigCoinSlot, colorDuration, {fill: '#37474F', colorDelay}, 0);
    this.hoverShake(pig);
  };

  leavePig() {
    let tl = new TimelineMax();
    tl.to(pigBodyElements, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigSnoutFront, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigBackElements, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigEarInner, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigNostrils, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigEyes, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(pigCoinSlot, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  hoverDiary() {
    let tl = new TimelineMax();
    tl.to(diaryBottom, colorDuration, {fill: '#4A99CE', colorDelay}, 0);
    tl.to(diaryPages, colorDuration, {fill: '#FFF', colorDelay}, 0);
    tl.to(diaryCover, colorDuration, {fill: '#ADE9F2', colorDelay}, 0);
    tl.to(diarySpine, colorDuration, {fill: '#4A99CE', colorDelay}, 0);
    this.hoverShake(diary);
  };

  leaveDiary() {
    let tl = new TimelineMax();
    tl.to(diaryBottom, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(diaryPages, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(diaryCover, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(diarySpine, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  hoverSleep() {
    let tl = new TimelineMax();
    tl.to(sleepMount, colorDuration, {fill: '#C6C6C6', colorDelay}, 0);
    tl.to(sleepButton, colorDuration, {fill: '#AA1721', colorDelay}, 0);
    this.hoverShake(sleep);
  };

  leaveSleep() {
    let tl = new TimelineMax();
    tl.to(sleepMount, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(sleepButton, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  }

  hoverDresser() {
    let tl = new TimelineMax();
    tl.to(dresserFrame, colorDuration, {fill: '#627172', colorDelay}, 0);
    tl.to(dresserDrawers, colorDuration, {fill: '#505B5B', colorDelay}, 0);
    tl.to(dresserKnobs, colorDuration, {fill: '#627172', colorDelay}, 0);
    this.hoverShake(dresser);
  };

  leaveDresser() {
    let tl = new TimelineMax();
    tl.to(dresserFrame, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(dresserDrawers, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(dresserKnobs, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  hoverCactus() {
    let tl = new TimelineMax();
    tl.to(cactusPotBody, colorDuration, {fill: '#603813', colorDelay}, 0);
    tl.to(cactusPotLip, colorDuration, {fill: '#965040', colorDelay}, 0);
    tl.to(cactusPotTop, colorDuration, {fill: '#a55447', colorDelay}, 0);
    tl.to(cactusBody, colorDuration, {fill: '#8cc63f', colorDelay}, 0);
    this.hoverShake(cactus);
  };

  leaveCactus() {
    let tl = new TimelineMax();
    tl.to(cactusPotBody, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(cactusPotLip, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(cactusPotTop, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(cactusBody, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  hoverFlower() {
    let tl = new TimelineMax();
    tl.to(flowerPotBottom, colorDuration, {fill: '#A55447', colorDelay}, 0);
    tl.to(flowerPotLip, colorDuration, {fill: '#965040', colorDelay}, 0);
    tl.to(flowerPotTop, colorDuration, {fill: '#603813', colorDelay}, 0);
    tl.to(leafBodyRight, colorDuration, {fill: '#39B54A', colorDelay}, 0);
    tl.to(leafBodyCenter, colorDuration, {fill: '#006837', colorDelay}, 0);
    tl.to(leafBodyLeft, colorDuration, {fill: '#009245', colorDelay}, 0);
    tl.to(flowerPetals, colorDuration, {fill: '#F9D7E4', colorDelay}, 0);
    tl.to(flowerStamens, colorDuration, {fill: '#FBB03B', colorDelay}, 0);
    this.hoverShake(flowers);
  };

  leaveFlower() {
    let tl = new TimelineMax();
    tl.to(flowerPotBottom, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(flowerPotLip, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(flowerPotTop, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(leafBodyRight, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(leafBodyCenter, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(leafBodyLeft, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(flowerPetals, colorDuration, {fill: colorDefault, colorDelay}, 0);
    tl.to(flowerStamens, colorDuration, {fill: colorDefault, colorDelay}, 0);
    this.leaveShake();
  };

  render() {
    const { classes } = this.props;

    const inputs = {
			svg: {
				dangerouslySetInnerHTML: {__html: $(this.svg).prop('outerHTML')},
        overflow: 'hidden',
			},
    };

    return (
      <Paper className={classes.root} elevation={3}>
        <div {...inputs.svg}/>
      </Paper>
    )
  };
};

export default withStyles(styles)(BedroomSVG)
