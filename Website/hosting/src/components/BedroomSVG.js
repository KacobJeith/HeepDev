import React from 'react';
import { svgs } from '../assets/remote/SVGs';
import { bedroomSVG } from '../assets/BedroomString';
import $ from 'jquery';
import { TimelineMax } from 'gsap';
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

var tlShake = new TimelineMax({repeat:-1});
var tlVertex = new TimelineMax ()

class BedroomSVG extends React.Component{

  constructor(props) {
		super(props);
    var bedroomDiv = document.createElement('div');
		bedroomDiv.innerHTML = bedroomSVG;
    this.svg = $(bedroomDiv).find('svg')[0];
    this.svg.setAttribute('preserveAspectRatio', 'xMidYMid meet');
    this.svg.setAttribute('viewBox', '0 0 1500 800')

    this.addButtonListeners = this.addButtonListeners.bind(this);

    this.hoverRemote = this.hoverRemote.bind(this);
    this.hoverPig = this.hoverPig.bind(this);
    this.hoverDiary = this.hoverDiary.bind(this);
    this.hoverSleep = this.hoverSleep.bind(this);
    this.hoverDresser = this.hoverDresser.bind(this);
    this.hoverDresser = this.hoverDresser.bind(this);
    this.hoverCactus = this.hoverCactus.bind(this);
    this.hoverFlower = this.hoverFlower.bind(this);

    this.leaveRemote = this.leaveRemote.bind(this);
    this.leavePig = this.leavePig.bind(this);
    this.leaveDiary = this.leaveDiary.bind(this);
    this.leaveSleep = this.leaveSleep.bind(this);
    this.leaveDresser = this.leaveDresser.bind(this);
    this.leaveDresser = this.leaveDresser.bind(this);
    this.leaveCactus = this.leaveCactus.bind(this);
    this.leaveFlower = this.leaveFlower.bind(this);

    this.clickRemote = this.clickRemote.bind(this);
    this.clickPig = this.clickPig.bind(this);
    this.clickDiary = this.clickDiary.bind(this);
	};

  componentDidMount() {
    this.getElements();
    this.addButtonListeners();
  };

  getElements() {
    var buttonRemote = document.getElementById('buttonRemote');
    var buttonPig = document.getElementById('buttonPig');
    var buttonDiary = document.getElementById('buttonDiary');
    var buttonSleep = document.getElementById('buttonSleep');
    var buttonDresserTop = document.getElementById('buttonDresserTop');
    var buttonDresserBottom = document.getElementById('buttonDresserBottom');
    var buttonCactus = document.getElementById('buttonCactus');
    var buttonFlower = document.getElementById('buttonFlower');

    var remote = document.getElementById('remote');

    var pig = document.getElementById('pig');

    var diary = document.getElementById('diary')
    var diaryOpen = document.getElementById('diaryOpen');

    var sleep = document.getElementById('sleep');

    var dresser = document.getElementById('dresser');
    var dresserDrawers = document.getElementById('dresserDrawers');

    var cactus = document.getElementById('cactus');

    var flowers = document.getElementById('flowers');

    var car = document.getElementById('car');
    var carAnimation = document.getElementById('carAnimation');
    var carSmoke1 = document.getElementById('carSmoke1');
    var carSmoke2 = document.getElementById('carSmoke2');
    var carSmoke3 = document.getElementById('carSmoke3');

    var solarSystem = document.getElementById('solarSystem');

    var lampBottom = document.getElementById('lampBottom');
    var lampShade = document.getElementById('lampShade');
    var lampTop = document.getElementById('lampTop');
    var lampLight = document.getElementById('lampLight');

    var clock = document.getElementById('clock');
    var clockBellLeft = document.getElementById('clockBellLeft');
    var clockBellRight = document.getElementById('clockBellRight');

    var vertexCarRemote = document.getElementById('vertexCarRemote');
  };

    addButtonListeners() {
      buttonRemote.addEventListener('mouseover', this.hoverRemote);
      buttonPig.addEventListener('mouseover', this.hoverPig);
      buttonDiary.addEventListener('mouseover', this.hoverDiary);
      buttonSleep.addEventListener('mouseover', this.hoverSleep);
      buttonDresserTop.addEventListener('mouseover', this.hoverDresser);
      buttonDresserBottom.addEventListener('mouseover', this.hoverDresser);
      buttonCactus.addEventListener('mouseover', this.hoverCactus);
      buttonFlower.addEventListener('mouseover', this.hoverFlower);

      buttonRemote.addEventListener('mouseleave', this.leaveRemote);
      buttonPig.addEventListener('mouseleave', this.leavePig);
      buttonDiary.addEventListener('mouseleave', this.leaveDiary);
      buttonSleep.addEventListener('mouseleave', this.leaveSleep);
      buttonDresserTop.addEventListener('mouseleave', this.leaveDresser);
      buttonDresserBottom.addEventListener('mouseleave', this.leaveDresser);
      buttonCactus.addEventListener('mouseleave', this.leaveCactus);
      buttonFlower.addEventListener('mouseleave', this.leaveFlower);

      buttonRemote.addEventListener('click', this.clickRemote);
      buttonPig.addEventListener('click', this.clickPig);
      buttonDiary.addEventListener('click', this.clickDiary);
  };

    removeButtonListeners() {
      buttonRemote.removeEventListener('mouseover', this.hoverRemote);
      buttonPig.removeEventListener('mouseover', this.hoverPig);
      buttonDiary.removeEventListener('mouseover', this.hoverDiary);
      buttonSleep.removeEventListener('mouseover', this.hoverSleep);
      buttonDresserTop.removeEventListener('mouseover', this.hoverDresser);
      buttonDresserBottom.removeEventListener('mouseover', this.hoverDresser);
      buttonCactus.removeEventListener('mouseover', this.hoverCactus);
      buttonFlower.removeEventListener('mouseover', this.hoverFlower);

      buttonRemote.removeEventListener('mouseleave', this.leaveRemote);
      buttonPig.removeEventListener('mouseleave', this.leavePig);
      buttonDiary.removeEventListener('mouseleave', this.leaveDiary);
      buttonSleep.removeEventListener('mouseleave', this.leaveSleep);
      buttonDresserTop.removeEventListener('mouseleave', this.leaveDresser);
      buttonDresserBottom.removeEventListener('mouseleave', this.leaveDresser);
      buttonCactus.removeEventListener('mouseleave', this.leaveCactus);
      buttonFlower.removeEventListener('mouseleave', this.leaveFlower);

      buttonRemote.removeEventListener('click', this.clickRemote);
      buttonPig.removeEventListener('click', this.clickPig);
      buttonDiary.removeEventListener('click', this.clickDiary);
    }

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

  drawLineTween(svg) {
    var pathObject = {length:0, pathLength: svg.getTotalLength()};
    TweenLite.to(svg, 0.1, {stroke: "#000"})
    var tween = TweenLite.to(pathObject, 2, {length:pathObject.pathLength, onUpdate:this.drawLine, onUpdateParams:[pathObject, svg], immediateRender:true});
    return tween;
  }

  drawLine(obj, svg) {
    svg.style.strokeDasharray = [obj.length, obj.pathLength].join(' ');
  };

  hideLine(svg) {
    var tween = TweenLite.to(svg, 0.1, {stroke: 'none'});
    return tween;
  }

  hoverRemote() {
    this.hoverShake(remote);
    this.vertexRemote();
  };

  leaveRemote() {
    this.leaveShake();
  };

  clickRemote() {
    this.removeButtonListeners();
    tlShake.clear();

    let tlCar = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    TweenLite.to(carAnimation, colorDuration, {display: 'block'});
    tlCar.fromTo([carSmoke1, carSmoke2, carSmoke3], 7.5, {y:-0.5}, {y:0.5, ease:RoughEase.ease.config({strength:20, points:20, template:Linear.easeNone, randomize:false}) , clearProps:"x"});
    tlCar.to(car, 1.2, {x: -70, ease: Sine.easeInOut}, 0.7);
    tlCar.to(car, 1, {x: 40, y: 160, ease: Sine.easeInOut}, 2);
    tlCar.to(car, 0.6, {x: 200, ease: Sine.easeInOut}, 3.1);
    tlCar.to(car, 0.6, {y: 80, ease: Sine.easeInOut}, 3.8);
    tlCar.to(car, 0.7, {x: -30, y: -10, ease: Sine.easeInOut}, 4.5);
    tlCar.to(car, 0.8, {y: 0, ease: Sine.easeInOut}, 5.3);
    tlCar.to(car, 0.8, {x: 0, ease: Sine.easeInOut}, 6.2);
    tlCar.to(carAnimation, 0.1, {display: 'none'});
    console.log("click")
  };

  vertexRemote() {
    //TweenLite.to(vertexCarRemote, 0.1, {strokeDasharray: 299, strokeDashoffset: 299})
    tlVertex.add(this.drawLineTween(vertexCarRemote));
    tlVertex.add(this.hideLine(vertexCarRemote));
    //tlVertex.clear();
    //tlVertex
  }

  hoverPig() {
    this.hoverShake(pig);
  };

  leavePig() {
    this.leaveShake();
  };

  clickPig() {
    this.removeButtonListeners();
    tlShake.clear();
    this.clickTheft();

    let tlPig = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    tlPig.to(pig, 2.3, {scaleX: 1.8, scaleY: 1.8, x:150, y: 325, yoyo: true, repeat: 1, ease: Sine.easeInOut}, 0.2)
  };

  hoverDiary() {
    this.hoverShake(diary);
  };

  leaveDiary() {
    this.leaveShake();
  };

  clickDiary() {
    this.removeButtonListeners();
    tlShake.clear();
    this.clickTheft();

    let tlDiary = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    tlDiary.to(diary, 0.1, {display: 'none'}, 0.2)
    tlDiary.to(diaryOpen, 0.1, {display: 'block'}, 0.2)
    tlDiary.to(diaryOpen, 2.2, {scaleX: 1.4, scaleY: 1.4, x:50, y: 50, yoyo: true, repeat: 1, ease: Sine.easeInOut}, 0.3)
    tlDiary.to(diaryOpen, 0.1, {display: 'none'}, 4.8)
    tlDiary.to(diary, 0.1, {display: 'block'}, 4.8)
  };

  clickTheft() {
    const tlTheft = new TimelineMax();

    const startTime = 0.2;

    TweenLite.to(lampShade, colorDuration, {fill: '#FFF3C0'});
    TweenLite.to(lampTop, colorDuration, {fill: '#FCEA6B'});
    TweenLite.to(lampLight, colorDuration, {display: 'block'});

    // flash lights
    tlTheft.fromTo(lampTop, 0.2, {fill: '#BC0D0D'}, {fill: '#FCEA6B', repeat: 25}, startTime)
    tlTheft.fromTo(lampShade, 0.2, {fill: '#E26F6F'}, {fill: '#FFF3C0', repeat: 25}, startTime)
    tlTheft.fromTo(lampLight, 0.2, {fill: '#C98181'}, {fill: '#EAE1B2', repeat: 25}, startTime)

    tlTheft.fromTo(clock, 0.1, {y: 5, x: 3}, {
      y: -5,
      x: -3,
      yoyo: true,
      repeat: 50,
      ease: Sine.easeInOut
    }, startTime);

    tlTheft.fromTo(clockBellLeft, 0.2, {rotation: -4, transformOrigin: "50%", y: 3}, {
      rotation: 4,
      transformOrigin: "50%",
      y: -3,
      yoyo: true,
      repeat: 26,
      ease: Sine.easeInOut
    }, startTime);

    tlTheft.fromTo(clockBellRight, 0.2, {rotation: 4, transformOrigin: "50%", y: -3}, {
      rotation: -4,
      transformOrigin: "50%",
      y: 3,
      yoyo: true,
      repeat: 25,
      ease: Sine.easeInOut
    }, startTime);

    tlTheft.fromTo(solarSystem, 0.5, {rotation: 10, transformOrigin: "50%"}, {
      rotation: -10,
      yoyo: true,
      repeat: 10,
      ease: Sine.easeInOut
    }, startTime)

    tlTheft.to(solarSystem, 0.25, {rotation: 0, transformOrigin: "50%"}, startTime+5);
    tlTheft.to(clock, 0.1, {x: 0, y: 0}, startTime+5.3);
    tlTheft.to(lampLight, 0.1, {display: 'none'}, startTime+5.3);
    tlTheft.to(lampTop, colorDuration, {fill: '#848383'}, startTime+5.3);
    tlTheft.to(lampShade, colorDuration, {fill: '#ADADAD'}, startTime+5.3);
  }

  hoverSleep() {
    this.hoverShake(sleep);
  };

  leaveSleep() {
    this.leaveShake();
  };

  hoverDresser() {
    this.hoverShake(dresser);
  };

  leaveDresser() {
    this.leaveShake();
  };

  hoverCactus() {
    this.hoverShake(cactus);
  };

  leaveCactus() {
    this.leaveShake();
  };

  hoverFlower() {
    this.hoverShake(flowers);
  };

  leaveFlower() {
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
