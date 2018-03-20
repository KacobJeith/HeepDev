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
    this.clickSleep = this.clickSleep.bind(this);
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
      buttonSleep.addEventListener('click', this.clickSleep);

      buttonRemote.setAttribute('cursor', 'pointer');
      buttonPig.setAttribute('cursor', 'pointer');
      buttonDiary.setAttribute('cursor', 'pointer');
      buttonSleep.setAttribute('cursor', 'pointer');
      buttonDresserTop.setAttribute('cursor', 'pointer');
      buttonDresserBottom.setAttribute('cursor', 'pointer');
      buttonCactus.setAttribute('cursor', 'pointer');
      buttonFlower.setAttribute('cursor', 'pointer');
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
      buttonSleep.removeEventListener('click', this.clickSleep);

      buttonRemote.removeAttribute('cursor', 'pointer');
      buttonPig.removeAttribute('cursor', 'pointer');
      buttonDiary.removeAttribute('cursor', 'pointer');
      buttonSleep.removeAttribute('cursor', 'pointer');
      buttonDresserTop.removeAttribute('cursor', 'pointer');
      buttonDresserBottom.removeAttribute('cursor', 'pointer');
      buttonCactus.removeAttribute('cursor', 'pointer');
      buttonFlower.removeAttribute('cursor', 'pointer');
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
    const startTime = 3.5

    tlCar.to(cometRemote, 0.05, {display:'block'})
         .to(cometRemote, 0.6, {bezier: { type: "cubic", values: pathRemoteCar}, ease: Sine.easeInOut})
         .to(cometRemote, 0.01, {display:'none', x: 0, y: 0})

         .to(glowCar, 0.01, {display:'block'})
         .to(glowCar, 0.75, {scaleX: 3.2, scaleY: 3.2, opacity: 0, transformOrigin: "center"})
         .to(glowCar, 0.01, {display: 'none'})
         .to(glowCar, 0.01, {scaleX: 1, scaleY: 1, opacity: 1, transformOrigin: "center"})

         .to(carAnimation, 0.05, {display: 'block'}, "=+0.5")
         .fromTo([carSmoke1, carSmoke2, carSmoke3], 7.5, {y:-0.5}, {
            y:0.5,
            ease:RoughEase.ease.config({
              strength:20,
              points:20,
              template:Sine.easeNone,
              randomize:false
            }) , clearProps:"x"}, "+=0.5")
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

    const cometPig = [cometPigLamp, cometPigPlanets, cometPigClock]
    const glowPig = [glowLamp, glowPlanets, glowClock]

    const pathPigLamp = MorphSVGPlugin.pathDataToBezier(vertexPigLamp, {align: alignPigLamp});
    const pathPigPlanets = MorphSVGPlugin.pathDataToBezier(vertexPigPlanets, {align: alignPigPlanets});
    const pathPigClock = MorphSVGPlugin.pathDataToBezier(vertexPigClock, {align: alignPigClock});

    // comets appear, animate along the path, and then disappear
    tlPig.to(cometPig, 0.05, {display:'block'})
         .to(cometPigLamp, 0.5, {bezier: { type: "cubic", values: pathPigLamp}, ease: Sine.easeInOut})
         .to(cometPigPlanets, 0.5, {bezier: { type: "cubic", values: pathPigPlanets}, ease: Sine.easeInOut}, '-=0.5')
         .to(cometPigClock, 0.5, {bezier: { type: "cubic", values: pathPigClock}, ease: Sine.easeInOut}, '-=0.5')
         .to(cometPig, 0.01, {display:'none', x: 0, y: 0})

    // pulsing glow after comet hits the object; triggers Theft animation
         .to(glowPig, 0.01, {display:'block'})
         .to(glowPig, 0.75, {scaleX: 4, scaleY: 4, opacity: 0, transformOrigin: "center"})
         .to(glowPig, 0.01, {display: 'none'})
         .to(glowPig, 0.01, {scaleX: 1, scaleY: 1, opacity: 1, transformOrigin: "center", onComplete: this.clickTheft.bind(this)})

    // pig animates toward the user and back
         .to(pig, 2.3, {
              scaleX: 1.8,
              scaleY: 1.8,
              x: 150,
              y: 325,
              yoyo: true,
              repeat: 1,
              ease: Sine.easeInOut
            }, 1.2);
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

    let tlDiary = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };

    const cometDiary = [cometDiaryLamp, cometDiaryPlanets, cometDiaryClock]
    const glowDiary = [glowLamp, glowPlanets, glowClock]

    const pathDiaryLamp = MorphSVGPlugin.pathDataToBezier(vertexDiaryLamp, {align: alignDiaryLamp});
    const pathDiaryPlanets = MorphSVGPlugin.pathDataToBezier(vertexDiaryPlanets, {align: alignDiaryPlanets});
    const pathDiaryClock = MorphSVGPlugin.pathDataToBezier(vertexDiaryClock, {align: alignDiaryClock});

    // comets appear, animate along the path, and then disappear
    tlDiary.to(cometDiary, 0.05, {display:'block'})
           .to(cometDiaryLamp, 0.5, {bezier: { type: "cubic", values: pathDiaryLamp}, ease: Sine.easeInOut})
           .to(cometDiaryPlanets, 0.5, {bezier: { type: "cubic", values: pathDiaryPlanets}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometDiaryClock, 0.5, {bezier: { type: "cubic", values: pathDiaryClock}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometDiary, 0.01, {display:'none', x: 0, y: 0})

    // pulsing glow after comet hits the object, triggers Theft animation
           .to(glowDiary, 0.01, {display:'block'})
           .to(glowDiary, 0.75, {scaleX: 4, scaleY: 4, opacity: 0, transformOrigin: "center"})
           .to(glowDiary, 0.01, {display: 'none'})
           .to(glowDiary, 0.01, {scaleX: 1, scaleY: 1, opacity: 1, transformOrigin: "center", onComplete: this.clickTheft.bind(this)})

    // frame of open diary appears; close diary disappears; open diary animates toward user
           .to(diary, 0.01, {display: 'none'}, 1)
           .to(diaryOpen, 0.01, {display: 'block'}, 1)
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
    const startTime = 0.3;

    //turn on the lights
    tlTheft.to(lampShade, 0.01, {fill: '#FFF3C0'}, 0.1)
           .to(lampTop, 0.01, {fill: '#FCEA6B'}, 0.1)
           .to(lampLight, 0.01, {fill: '#EAE1B2', display: 'block'}, 0.1)

    //flash lights
           .fromTo(lampTop, 0.2, {fill: '#BC0D0D'}, {fill: '#FCEA6B', repeat: 25}, startTime)
           .fromTo(lampShade, 0.2, {fill: '#E26F6F'}, {fill: '#FFF3C0', repeat: 25}, startTime)
           .fromTo(lampLight, 0.2, {fill: '#C98181'}, {fill: '#EAE1B2', repeat: 25}, startTime)

    //bounce clock up and down
           .fromTo(clock, 0.1, {y: 5, x: 3}, {
              y: -5,
              x: -3,
              yoyo: true,
              repeat: 44,
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
              repeat: 22,
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
              repeat: 21,
              ease: Sine.easeInOut
            }, startTime)

    //planets wobble back and forth
            .to(solarSystem, 0.6, {
              rotation: 15,
              ease: Sine.easeInOut,
              transformOrigin: "50%"
            }, startTime)

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
            }, startTime+0.6)

    //move things back into place
          .to(solarSystem, 0.25, {rotation: 0, transformOrigin: "50%"}, startTime+4.5)
          .to(clock, 0.1, {x: 0, y: 0}, startTime+4.8)

    // make things disappear
    .to(lampLight, 0.1, {display: 'none'}, startTime+4.8)
    .to(lampTop, 0.1, {fill: '#848383'}, startTime+4.8)
    .to(lampShade, 0.1, {fill: '#ADADAD'}, startTime+4.8)
  }

  hoverSleep() {
    this.hoverShake(sleep);
  };

  leaveSleep() {
    this.leaveShake();
  };

  clickSleep() {
    this.removeButtonListeners();
    tlShake.clear();

    const tlSleep = new TimelineMax({onComplete: proxyFunction.bind(this)});
    function proxyFunction(): void {
      this.addButtonListeners();
    };
    // variables for comets
    const pathSleepBlinds = MorphSVGPlugin.pathDataToBezier(vertexSleepBlinds, {align: alignSleepBlinds});
    const pathSleepPlanets = MorphSVGPlugin.pathDataToBezier(vertexSleepPlanets, {align: alignSleepPlanets});
    const pathSleepClock = MorphSVGPlugin.pathDataToBezier(vertexSleepClock, {align: alignSleepClock});
    const pathSleepNitelite = MorphSVGPlugin.pathDataToBezier(vertexSleepNitelite, {align: alignSleepNitelite});

    const cometSleep = [cometSleepBlinds, cometSleepPlanets, cometSleepClock, cometSleepNitelite]
    const glowSleep = [glowBlinds, glowPlanets, glowClock, glowNitelite]

    const pathSun = MorphSVGPlugin.pathDataToBezier(pathSunset, {align: alignPathSunset});
    const pathMoon = MorphSVGPlugin.pathDataToBezier(pathMoonrise, {align: alignPathMoonrise});

    // comets appear, animate along the path, and then disappear
    tlSleep.to(cometSleep, 0.05, {display:'block'})
           .to(cometSleepBlinds, 0.5, {bezier: { type: "cubic", values: pathSleepBlinds}, ease: Sine.easeInOut})
           .to(cometSleepPlanets, 0.5, {bezier: { type: "cubic", values: pathSleepPlanets}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometSleepClock, 0.5, {bezier: { type: "cubic", values: pathSleepClock}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometSleepNitelite, 0.5, {bezier: { type: "cubic", values: pathSleepNitelite}, ease: Sine.easeInOut}, '-=0.5')
           .to(cometSleep, 0.01, {display:'none', x: 0, y: 0})

    // pulsing glow after comet hits the object
           .to(glowSleep, 0.01, {display:'block'})
           .to(glowSleep, 0.75, {scaleX: 4, scaleY: 4, opacity: 0, transformOrigin: "center"})
           .to(glowSleep, 0.01, {display: 'none'})
           .to(glowSleep, 0.01, {scaleX: 1, scaleY: 1, opacity: 1, transformOrigin: "center"})

    // animate sunset and moonrise
          // sunset animation along path with color change
           .to([outsideSun, outsideSunGlow], 4, {bezier: {type: "cubic", values: pathSun}, ease: Sine.easeInOut, scaleX: 1.4, scaleY: 1.4, transformOrigin: "center"}, "+=0.5")
           .to(outsideSun, 2, {fill: "#f26f41"}, "-=4")
           .staggerTo("#outsideSunGlow_1_ stop", 3, {
             stopColor: "#f26f41",
             ease: Sine.easeInOut,
             cycle: {
               stopColor: ["#f26f41", "#fff"]
             }
           }, 0, "-=4")

          // first color change of clouds to reddish
           .to(cloudLeft, 4, {fill: "#ffd69f"}, "-=4")
           .to(cloudCenter, 4, {fill: "#f28757"}, "-=4")
           .to(cloudRight, 4, {fill: "#d6b39a"}, "-=4")

          // first color change of sky to red
           .staggerTo("#outsideSky_1_ stop", 4, {
             stopColor: "#b1e6f2",
             ease: Sine.easeInOut,
             cycle: {
               stopColor: ["#b1e6f2", "#ff7654"]
             }
           }, 1, "-=4")
           .to([windowGlare1, windowGlare2, windowGlare3], 1, {opacity: 0}, "-=4")

          // second color change of cloud to purple
           .to(cloudLeft, 5, {fill: "#9e97b6"})
           .to(cloudCenter, 5, {fill: "#443d56"}, "-=5")
           .to(cloudRight, 5, {fill: "#4d495b"}, "-=5")

          // second color change of sky to purple
           .staggerTo("#outsideSky_1_ stop", 2, {
             stopColor: "#ff7654",
             ease: Sine.easeInOut,
             cycle: {
               stopColor: ["#ff7654", "#110f27"]
             }
           }, 1, "-=6")

          // third color change of sky to completely purple
           .staggerTo("#outsideSky_1_ stop", 3, {
             stopColor: "#110f27",
             ease: Sine.easeInOut,
             cycle: {
               stopColor: ["#110f27", "#110f27"]
             }
           }, 0, "-=3")

          // moonrise animation
           .to(outsideMoon, 3, {bezier: {type: "cubic", values: pathMoon}, ease: Sine.easeInOut}, "-=4")

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

  hoverFlower() {sv
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
