import React from 'react';
import { bedroomSVG } from './BedroomString';
import $ from 'jquery';
//import * as MorphSVGPlugin from './gsap/MorphSVGPlugin'
import { TimelineMax } from 'gsap';
import MorphSVGPlugin from '../utilities/MorphSvgPlugin';
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

//var tlVertex = new TimelineMax();

var tlShake = new TimelineMax({repeat:-1});
var tlVertexRemote = new TimelineMax();
var tlVertexDiary = new TimelineMax();
var tlVertexPig = new TimelineMax();

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
    this.addButtonListeners();
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
    this.hoverShake(remote);
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

    const pathRemoteCar = MorphSVGPlugin.pathDataToBezier(vertexRemoteCar, {align: alignRemote});
    const startTime = 0.5

    tlCar.to(cometRemote, 0.05, {display:'block'})
         .to(cometRemote, 0.6, {bezier: { type: "cubic", values: pathRemoteCar}, ease: Sine.easeInOut})
         .to(cometRemote, 0.05, {display:'none'})
         .to(cometRemote, 0.01, {x: 0, y: 0})
         .to(carAnimation, 0.05, {display: 'block'}, 0.5)
         .fromTo([carSmoke1, carSmoke2, carSmoke3], 7.5, {y:-0.5}, {
            y:0.5,
            ease:RoughEase.ease.config({
              strength:20,
              points:20,
              template:Sine.easeNone,
              randomize:false
            }) , clearProps:"x"}, startTime)
         .fromTo(carBodyGroup, 7.5, {y:-0.02}, {
            y:0.02,
            ease:RoughEase.ease.config({
              strength:100,
              points:100,
              template:Sine.easeNone,
              randomize:false
            }) , clearProps:"x"}, '-=7.5')
         .to(car, 1.2, {x: -70, ease: Sine.easeInOut}, 0.7 + startTime)
         .to(car, 1, {x: 40, y: 160, ease: Sine.easeInOut}, 2 + startTime)
         .to(car, 0.6, {x: 200, ease: Sine.easeInOut}, 3.1 + startTime)
         .to(car, 0.6, {y: 80, ease: Sine.easeInOut}, 3.8 + startTime)
         .to(car, 0.7, {x: -30, y: -10, ease: Sine.easeInOut}, 4.5 + startTime)
         .to(car, 0.8, {y: 0, ease: Sine.easeInOut}, 5.3 + startTime)
         .to(car, 0.8, {x: 0, ease: Sine.easeInOut}, 6.2 + startTime)
         .to(carAnimation, 0.1, {display: 'none'})
  };

  hoverPig() {
    this.hoverShake(pig);
  };

  leavePig() {
    this.leaveShake();
  };

  clickPig() {
    this.removeButtonListeners();
    tlShake.clear();

    let tlPig = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    const pathPigLamp = MorphSVGPlugin.pathDataToBezier(vertexPigLamp, {align: alignPigLamp});
    const pathPigPlanets = MorphSVGPlugin.pathDataToBezier(vertexPigPlanets, {align: alignPigPlanets});
    const pathPigClock = MorphSVGPlugin.pathDataToBezier(vertexPigClock, {align: alignPigClock});

    tlPig.to(cometPigLamp, 0.05, {display:'block'})
         .to(cometPigPlanets, 0.05, {display:'block'}, '-=0.05')
         .to(cometPigClock, 0.05, {display:'block'}, '-=0.05')

         .to(cometPigLamp, 0.5, {bezier: { type: "cubic", values: pathPigLamp}, ease: Sine.easeInOut})
         .to(cometPigPlanets, 0.5, {bezier: { type: "cubic", values: pathPigPlanets}, ease: Sine.easeInOut}, '-=0.5')
         .to(cometPigClock, 0.5, {bezier: { type: "cubic", values: pathPigClock}, ease: Sine.easeInOut}, '-=0.5')

         .to(cometPigLamp, 0.05, {display:'none'})
         .to(cometPigPlanets, 0.05, {display:'none'}, '-=0.05')
         .to(cometPigClock, 0.05, {display:'none'}, '-=0.05')

         .to(cometPigLamp, 0.1, {x: 0, y: 0})
         .to(cometPigPlanets, 0.1, {x: 0, y: 0}, '-=0.1')
         .to(cometPigClock, 0.1, {x: 0, y: 0, onComplete: this.clickTheft.bind(this)}, '-=0.1')

         .to(pig, 2.3, {
              scaleX: 1.8,
              scaleY: 1.8,
              x: 150,
              y: 325,
              yoyo: true,
              repeat: 1,
              ease: Sine.easeInOut
            }, 0.2);
  };

  hoverDiary() {
    this.hoverShake(diary);
    if (this.state.animation == false) {
      this.vertexDiary()
    }
  };

  leaveDiary() {
    this.leaveShake();
  };

  clickDiary() {
    this.removeButtonListeners();
    tlShake.clear();

    let tlDiary = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    const pathDiaryLamp = MorphSVGPlugin.pathDataToBezier(vertexDiaryLamp, {align: alignDiaryLamp});
    const pathDiaryPlanets = MorphSVGPlugin.pathDataToBezier(vertexDiaryPlanets, {align: alignDiaryPlanets});
    const pathDiaryClock = MorphSVGPlugin.pathDataToBezier(vertexDiaryClock, {align: alignDiaryClock});

    tlDiary.to(cometDiaryLamp, 0.05, {display:'block'})
           .to(cometDiaryPlanets, 0.05, {display:'block'}, '-=0.05')
           .to(cometDiaryClock, 0.05, {display:'block'}, '-=0.05')

           .to(cometDiaryLamp, 0.5, {bezier: { type: "cubic", values: pathDiaryLamp}, ease: Sine.easeInOut})
           .to(cometDiaryPlanets, 0.5, {bezier: { type: "cubic", values: pathDiaryPlanets}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometDiaryClock, 0.5, {bezier: { type: "cubic", values: pathDiaryClock}, ease: Sine.easeInOut}, '-=0.5')

           .to(cometDiaryLamp, 0.05, {display:'none'})
           .to(cometDiaryPlanets, 0.05, {display:'none'}, '-=0.05')
           .to(cometDiaryClock, 0.05, {display:'none'}, '-=0.05')

           .to(cometDiaryLamp, 0.1, {x: 0, y: 0})
           .to(cometDiaryPlanets, 0.1, {x: 0, y: 0}, '-=0.1')
           .to(cometDiaryClock, 0.1, {x: 0, y: 0, onComplete: this.clickTheft.bind(this)}, '-=0.1')

           .to(diary, 0.1, {display: 'none'}, 0.2)
           .to(diaryOpen, 0.1, {display: 'block'}, 0.2)
           .to(diaryOpen, 2.2, {
                scaleX: 1.4,
                scaleY: 1.4,
                x:50,
                y: 50,
                yoyo: true,
                repeat: 1,
                ease: Sine.easeInOut
              }, 0.3)
          .to(diaryOpen, 0.01, {display: 'none'})
          .to(diary, 0.01, {display: 'block'})
  };

  clickTheft() {
    const tlTheft = new TimelineMax();
    const startTime = 0.1;

    //turn on the lights
    tlTheft.to(lampShade, 0.01, {fill: '#FFF3C0'}, 0.01)
           .to(lampTop, 0.01, {fill: '#FCEA6B'}, 0.01)
           .to(lampLight, 0.01, {fill: '#EAE1B2', display: 'block'}, 0.01)

    //flash lights
           .fromTo(lampTop, 0.2, {fill: '#BC0D0D'}, {fill: '#FCEA6B', repeat: 25}, startTime)
           .fromTo(lampShade, 0.2, {fill: '#E26F6F'}, {fill: '#FFF3C0', repeat: 25}, startTime)
           .fromTo(lampLight, 0.2, {fill: '#C98181'}, {fill: '#EAE1B2', repeat: 25}, startTime)

    //bounce clock up and down
           .fromTo(clock, 0.1, {y: 5, x: 3}, {
              y: -5,
              x: -3,
              yoyo: true,
              repeat: 50,
              ease: Sine.easeInOut
            }, startTime)

    //move clock bells
            .fromTo(clockBellLeft, 0.2, {
              rotation: -4,
              transformOrigin: "50%",
              y: 3
            },
            {
              rotation: 4,
              transformOrigin: "50%",
              y: -3,
              yoyo: true,
              repeat: 26,
              ease: Sine.easeInOut
            }, startTime)

            .fromTo(clockBellRight, 0.2, {
              rotation: 4,
              transformOrigin: "50%",
              y: -3
            },
            {
              rotation: -4,
              transformOrigin: "50%",
              y: 3,
              yoyo: true,
              repeat: 25,
              ease: Sine.easeInOut
            }, startTime)

    //planets wobble back and forth
            .fromTo(solarSystem, 0.5, {
              rotation: 10,
              transformOrigin: "50%",
              ease: Sine.easeInOut
            },
            {
              rotation: -10,
              yoyo: true,
              repeat: 10,
              ease: Sine.easeInOut
            }, startTime+0.25)

    //move things back into place
          .to(solarSystem, 0.25, {rotation: 0, transformOrigin: "50%"}, startTime+5)
          .to(clock, 0.1, {x: 0, y: 0}, startTime+5.3)

    // make things disappear
    .to(lampLight, 0.1, {display: 'none'}, startTime+5.3)
    .to(lampTop, 0.1, {fill: '#848383'}, startTime+5.3)
    .to(lampShade, 0.1, {fill: '#ADADAD'}, startTime+5.3)
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
