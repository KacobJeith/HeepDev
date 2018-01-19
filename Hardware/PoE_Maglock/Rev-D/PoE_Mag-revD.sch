<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="8.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="9" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="57" name="tCAD" color="7" fill="1" visible="no" active="no"/>
<layer number="59" name="tCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="60" name="bCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="no" active="no"/>
<layer number="100" name="Muster" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="yes" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="yes" active="yes"/>
<layer number="103" name="Stiffner" color="7" fill="1" visible="yes" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="7" fill="1" visible="yes" active="yes"/>
<layer number="106" name="BGA-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="107" name="BD-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="108" name="tBridges" color="7" fill="1" visible="yes" active="yes"/>
<layer number="109" name="tBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="110" name="bBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="111" name="MPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="112" name="tSilk" color="7" fill="1" visible="yes" active="yes"/>
<layer number="113" name="ReferenceLS" color="7" fill="1" visible="no" active="no"/>
<layer number="114" name="Badge_Outline" color="7" fill="1" visible="yes" active="yes"/>
<layer number="115" name="ReferenceISLANDS" color="7" fill="1" visible="yes" active="yes"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="yes" active="yes"/>
<layer number="118" name="Rect_Pads" color="7" fill="1" visible="no" active="no"/>
<layer number="121" name="sName" color="7" fill="1" visible="yes" active="yes"/>
<layer number="122" name="_bPlace" color="7" fill="1" visible="yes" active="yes"/>
<layer number="123" name="tTestmark" color="7" fill="1" visible="yes" active="yes"/>
<layer number="124" name="bTestmark" color="7" fill="1" visible="yes" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="126" name="_bNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="127" name="_tValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="128" name="_bValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="129" name="Mask" color="7" fill="1" visible="yes" active="yes"/>
<layer number="131" name="tAdjust" color="7" fill="1" visible="yes" active="yes"/>
<layer number="132" name="bAdjust" color="7" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="yes" active="yes"/>
<layer number="150" name="Notes" color="7" fill="1" visible="yes" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="yes" active="yes"/>
<layer number="152" name="_bDocu" color="7" fill="1" visible="yes" active="yes"/>
<layer number="153" name="FabDoc1" color="6" fill="1" visible="no" active="no"/>
<layer number="154" name="FabDoc2" color="2" fill="1" visible="no" active="no"/>
<layer number="155" name="FabDoc3" color="7" fill="15" visible="no" active="no"/>
<layer number="199" name="Contour" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="yes" active="yes"/>
<layer number="201" name="201bmp" color="2" fill="10" visible="yes" active="yes"/>
<layer number="202" name="202bmp" color="3" fill="10" visible="yes" active="yes"/>
<layer number="203" name="203bmp" color="4" fill="10" visible="yes" active="yes"/>
<layer number="204" name="204bmp" color="5" fill="10" visible="yes" active="yes"/>
<layer number="205" name="205bmp" color="6" fill="10" visible="yes" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="10" visible="yes" active="yes"/>
<layer number="207" name="207bmp" color="8" fill="10" visible="yes" active="yes"/>
<layer number="208" name="208bmp" color="9" fill="10" visible="yes" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="225" name="225bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="226" name="226bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="227" name="227bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="228" name="228bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="229" name="229bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="230" name="230bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="231" name="Eagle3D_PG1" color="7" fill="1" visible="no" active="no"/>
<layer number="232" name="Eagle3D_PG2" color="7" fill="1" visible="no" active="no"/>
<layer number="233" name="Eagle3D_PG3" color="7" fill="1" visible="no" active="no"/>
<layer number="248" name="Housing" color="7" fill="1" visible="yes" active="yes"/>
<layer number="249" name="Edge" color="7" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="yes" active="yes"/>
<layer number="254" name="cooling" color="7" fill="1" visible="yes" active="yes"/>
<layer number="255" name="routoute" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Heep">
<packages>
<package name="AG9900">
<smd name="V+1" x="0" y="0" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="V+2" x="2.54" y="0" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="V-" x="16.21" y="0" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="ADJ" x="18.75" y="0" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="VIN-2" x="0" y="14" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="VIN-1" x="2.54" y="14" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="VIN+2" x="16.21" y="14" dx="4" dy="1.25" layer="1" rot="R90"/>
<smd name="VIN+1" x="18.75" y="14" dx="4" dy="1.25" layer="1" rot="R90"/>
<polygon width="0.127" layer="39" pour="hatch">
<vertex x="3.81" y="0"/>
<vertex x="15.24" y="0"/>
<vertex x="15.24" y="6.35"/>
<vertex x="20.32" y="6.35"/>
<vertex x="20.32" y="8.89"/>
<vertex x="12.7" y="8.89"/>
<vertex x="12.7" y="3.81"/>
<vertex x="7.62" y="3.81"/>
<vertex x="7.62" y="6.35"/>
<vertex x="-1.27" y="6.35"/>
<vertex x="-1.27" y="2.54"/>
<vertex x="3.81" y="2.54"/>
</polygon>
<polygon width="0.1524" layer="21">
<vertex x="0.635" y="4.445"/>
<vertex x="1.5875" y="4.445"/>
<vertex x="1.5875" y="3.4925"/>
<vertex x="0.635" y="3.4925"/>
</polygon>
</package>
<package name="AG9800M">
<smd name="V+1" x="0" y="0" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="V+2" x="2.54" y="0" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="V-" x="20.32" y="0" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="ADJ" x="22.86" y="0" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="VIN-2" x="0" y="18" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="VIN-1" x="2.54" y="18" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="VIN+2" x="20.32" y="18" dx="1.25" dy="4" layer="1" rot="R180"/>
<smd name="VIN+1" x="22.86" y="18" dx="1.25" dy="4" layer="1" rot="R180"/>
<rectangle x1="-1.27" y1="2.16" x2="24.13" y2="10.16" layer="39"/>
</package>
<package name="J1">
<description>&lt;b&gt;PULSEJACK (TM) 1x1 Tab-UP RJ45&lt;/b&gt;&lt;p&gt;
10/100 Base-TX RJ45 1x1 Tab-UP with LEDs 8-pin (J1 series) and 6-pin (JP series) integrated magnetics connector,&lt;br&gt;
designed to support applications, such as ADSL modems, LAN-on-Motherboard, and Hub and Switches.&lt;br&gt;
Source: www.pulseeng.com .. PulseJack-J402.pdf</description>
<wire x1="7.875" y1="-17.05" x2="7.875" y2="4.34" width="0.2032" layer="51"/>
<wire x1="-7.875" y1="4.34" x2="-7.875" y2="-17.05" width="0.2032" layer="51"/>
<wire x1="-6.8922" y1="-16.9332" x2="-6.5774" y2="-8.8515" width="0.2032" layer="21"/>
<wire x1="-6.5774" y1="-8.8515" x2="-6.2975" y2="-8.5716" width="0.2032" layer="21" curve="-85.555511"/>
<wire x1="-6.3675" y1="-16.9332" x2="-6.1575" y2="-9.8661" width="0.2032" layer="21"/>
<wire x1="-6.1575" y1="-9.8661" x2="-4.6531" y2="-9.8661" width="0.2032" layer="21" curve="-176.58855"/>
<wire x1="-4.6531" y1="-9.8661" x2="-4.4082" y2="-16.9682" width="0.2032" layer="21"/>
<wire x1="-3.8834" y1="-16.9332" x2="-4.1982" y2="-8.8515" width="0.2032" layer="21"/>
<wire x1="-4.1982" y1="-8.8515" x2="-4.4781" y2="-8.5716" width="0.2032" layer="21" curve="85.555511"/>
<wire x1="-6.2975" y1="-8.5716" x2="-4.4781" y2="-8.5716" width="0.2032" layer="21"/>
<wire x1="6.8922" y1="-16.9332" x2="6.5774" y2="-8.8515" width="0.2032" layer="21"/>
<wire x1="6.5774" y1="-8.8515" x2="6.2975" y2="-8.5716" width="0.2032" layer="21" curve="85.555511"/>
<wire x1="6.3675" y1="-16.9332" x2="6.1575" y2="-9.8661" width="0.2032" layer="21"/>
<wire x1="6.1575" y1="-9.8661" x2="4.6531" y2="-9.8661" width="0.2032" layer="21" curve="176.58855"/>
<wire x1="4.6531" y1="-9.8661" x2="4.4082" y2="-16.9682" width="0.2032" layer="21"/>
<wire x1="3.8834" y1="-16.9332" x2="4.1982" y2="-8.8515" width="0.2032" layer="21"/>
<wire x1="4.1982" y1="-8.8515" x2="4.4781" y2="-8.5716" width="0.2032" layer="21" curve="-85.555511"/>
<wire x1="6.2975" y1="-8.5716" x2="4.4781" y2="-8.5716" width="0.2032" layer="21"/>
<pad name="6" x="-0.635" y="2.54" drill="0.9" diameter="1.3"/>
<pad name="5" x="0.635" y="0" drill="0.9" diameter="1.3"/>
<pad name="8" x="-3.175" y="2.54" drill="0.9" diameter="1.3"/>
<pad name="7" x="-1.905" y="0" drill="0.9" diameter="1.3"/>
<pad name="10" x="-5.715" y="2.54" drill="0.9" diameter="1.3"/>
<pad name="9" x="-4.445" y="0" drill="0.9" diameter="1.3"/>
<pad name="M1" x="-7.875" y="-3.3" drill="1.6" diameter="2.1844"/>
<pad name="M2" x="7.875" y="-3.3" drill="1.6" diameter="2.1844"/>
<pad name="14" x="7.0104" y="-11.307" drill="1" diameter="1.4224" rot="R270"/>
<pad name="12" x="-7.0104" y="-11.307" drill="1" diameter="1.4224" rot="R90"/>
<pad name="13" x="7.0104" y="-9.275" drill="1" diameter="1.4224" rot="R270"/>
<pad name="11" x="-7.0104" y="-9.275" drill="1" diameter="1.4224" rot="R90"/>
<text x="-7.62" y="8.89" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.35" y="5.715" size="1.27" layer="27">&gt;VALUE</text>
<hole x="5.715" y="-6.35" drill="3.3"/>
<hole x="-5.715" y="-6.35" drill="3.3"/>
<pad name="1" x="5.715" y="0" drill="0.9" diameter="1.3"/>
<pad name="2" x="4.445" y="2.54" drill="0.9" diameter="1.3"/>
<wire x1="-7.874" y1="-17.018" x2="7.874" y2="-17.018" width="0.127" layer="21"/>
<wire x1="-7.874" y1="4.318" x2="7.874" y2="4.318" width="0.127" layer="21"/>
</package>
<package name="HANRUN_POE">
<wire x1="-7.875" y1="10.7" x2="-7.875" y2="-10.69" width="0.2032" layer="51"/>
<wire x1="7.875" y1="-10.69" x2="7.875" y2="10.7" width="0.2032" layer="51"/>
<wire x1="6.8922" y1="10.5832" x2="6.5774" y2="2.5015" width="0.2032" layer="21"/>
<wire x1="6.5774" y1="2.5015" x2="6.2975" y2="2.2216" width="0.2032" layer="21" curve="-85.555511"/>
<wire x1="6.3675" y1="10.5832" x2="6.1575" y2="3.5161" width="0.2032" layer="21"/>
<wire x1="6.1575" y1="3.5161" x2="4.6531" y2="3.5161" width="0.2032" layer="21" curve="-176.58855"/>
<wire x1="4.6531" y1="3.5161" x2="4.4082" y2="10.6182" width="0.2032" layer="21"/>
<wire x1="3.8834" y1="10.5832" x2="4.1982" y2="2.5015" width="0.2032" layer="21"/>
<wire x1="4.1982" y1="2.5015" x2="4.4781" y2="2.2216" width="0.2032" layer="21" curve="85.555511"/>
<wire x1="6.2975" y1="2.2216" x2="4.4781" y2="2.2216" width="0.2032" layer="21"/>
<wire x1="-6.8922" y1="10.5832" x2="-6.5774" y2="2.5015" width="0.2032" layer="21"/>
<wire x1="-6.5774" y1="2.5015" x2="-6.2975" y2="2.2216" width="0.2032" layer="21" curve="85.555511"/>
<wire x1="-6.3675" y1="10.5832" x2="-6.1575" y2="3.5161" width="0.2032" layer="21"/>
<wire x1="-6.1575" y1="3.5161" x2="-4.6531" y2="3.5161" width="0.2032" layer="21" curve="176.58855"/>
<wire x1="-4.6531" y1="3.5161" x2="-4.4082" y2="10.6182" width="0.2032" layer="21"/>
<wire x1="-3.8834" y1="10.5832" x2="-4.1982" y2="2.5015" width="0.2032" layer="21"/>
<wire x1="-4.1982" y1="2.5015" x2="-4.4781" y2="2.2216" width="0.2032" layer="21" curve="-85.555511"/>
<wire x1="-6.2975" y1="2.2216" x2="-4.4781" y2="2.2216" width="0.2032" layer="21"/>
<pad name="5" x="0.635" y="-8.89" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="6" x="-0.635" y="-6.35" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="3" x="3.175" y="-8.89" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="4" x="1.905" y="-6.35" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="1" x="5.715" y="-8.89" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="2" x="4.445" y="-6.35" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="M1" x="7.875" y="-3.05" drill="1.6" diameter="2.1844" rot="R180"/>
<pad name="M2" x="-7.875" y="-3.05" drill="1.6" diameter="2.1844" rot="R180"/>
<pad name="13" x="-4.085" y="4.08" drill="1" diameter="1.4224" rot="R90"/>
<pad name="12" x="4.085" y="4.08" drill="1" diameter="1.4224" rot="R270"/>
<pad name="14" x="-6.625" y="4.08" drill="1" diameter="1.4224" rot="R90"/>
<pad name="11" x="6.625" y="4.08" drill="1" diameter="1.4224" rot="R270"/>
<text x="7.62" y="-15.24" size="1.27" layer="25" rot="R180">&gt;NAME</text>
<text x="6.35" y="-12.065" size="1.27" layer="27" rot="R180">&gt;VALUE</text>
<hole x="-5.715" y="0" drill="3.3"/>
<hole x="5.715" y="0" drill="3.3"/>
<pad name="10" x="-5.715" y="-6.35" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="9" x="-4.445" y="-8.89" drill="0.9" diameter="1.3" rot="R180"/>
<wire x1="7.874" y1="10.668" x2="-7.874" y2="10.668" width="0.127" layer="21"/>
<wire x1="7.874" y1="-10.668" x2="-7.874" y2="-10.668" width="0.127" layer="21"/>
<pad name="8" x="-3.175" y="-6.35" drill="0.9" diameter="1.3" rot="R180"/>
<pad name="7" x="-1.905" y="-8.89" drill="0.9" diameter="1.3" rot="R180"/>
</package>
<package name="AG5200">
<wire x1="0" y1="0" x2="50.6" y2="0" width="0.127" layer="21"/>
<wire x1="50.6" y1="0" x2="50.6" y2="-30" width="0.127" layer="21"/>
<wire x1="50.6" y1="-30" x2="0" y2="-30" width="0.127" layer="21"/>
<wire x1="0" y1="-30" x2="0" y2="0" width="0.127" layer="21"/>
<pad name="P$1" x="2.44" y="-7.4" drill="1"/>
<pad name="P$2" x="2.44" y="-9.94" drill="1"/>
<pad name="P$3" x="2.44" y="-12.48" drill="1"/>
<pad name="P$4" x="2.44" y="-15.02" drill="1"/>
<pad name="P$5" x="2.44" y="-17.56" drill="1"/>
<pad name="P$6" x="2.44" y="-20.1" drill="1"/>
<pad name="P$11" x="48.16" y="-9.94" drill="1"/>
<pad name="P$10" x="48.16" y="-12.48" drill="1"/>
<pad name="P$9" x="48.16" y="-15.02" drill="1"/>
<pad name="P$8" x="48.16" y="-17.56" drill="1"/>
<pad name="P$7" x="48.16" y="-20.1" drill="1"/>
</package>
<package name="AG5300">
<pad name="P$1" x="5.11" y="2.3" drill="1" shape="octagon"/>
<pad name="P$2" x="7.65" y="2.3" drill="1" shape="octagon"/>
<pad name="P$3" x="10.19" y="2.3" drill="1" shape="octagon"/>
<pad name="P$4" x="12.73" y="2.3" drill="1" shape="octagon"/>
<pad name="P$5" x="15.27" y="2.3" drill="1" shape="octagon"/>
<pad name="P$6" x="17.81" y="2.3" drill="1" shape="octagon"/>
<pad name="P$7" x="48.29" y="2.3" drill="1" shape="octagon"/>
<pad name="P$8" x="50.83" y="2.3" drill="1" shape="octagon"/>
<pad name="P$9" x="53.37" y="2.3" drill="1" shape="octagon"/>
<pad name="P$10" x="55.91" y="2.3" drill="1" shape="octagon"/>
<wire x1="0" y1="0" x2="26.3" y2="0" width="0.127" layer="21"/>
<wire x1="26.3" y1="0" x2="26.3" y2="-8.4" width="0.127" layer="21"/>
<wire x1="26.3" y1="-8.4" x2="41.3" y2="-8.4" width="0.127" layer="21"/>
<wire x1="41.3" y1="-8.4" x2="41.3" y2="0" width="0.127" layer="21"/>
<wire x1="41.3" y1="0" x2="57.3" y2="0" width="0.127" layer="21"/>
<wire x1="57.3" y1="0" x2="57.3" y2="9.6" width="0.127" layer="21"/>
<wire x1="57.3" y1="9.6" x2="0" y2="9.6" width="0.127" layer="21"/>
<wire x1="0" y1="9.6" x2="0" y2="0" width="0.127" layer="21"/>
</package>
<package name="QFN-16">
<smd name="PAD" x="0" y="0" dx="1.7" dy="1.7" layer="1" rot="R270"/>
<smd name="P3" x="-1.45" y="-0.25" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R270"/>
<smd name="P7" x="0.25" y="-1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P10" x="1.45" y="-0.25" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R90"/>
<smd name="P2" x="-1.45" y="0.25" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R270"/>
<smd name="P1" x="-1.45" y="0.75" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R270"/>
<smd name="P4" x="-1.45" y="-0.75" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R270"/>
<smd name="P9" x="1.45" y="-0.75" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R90"/>
<smd name="P11" x="1.45" y="0.25" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R90"/>
<smd name="P12" x="1.45" y="0.75" dx="0.3" dy="0.8" layer="1" roundness="100" rot="R90"/>
<smd name="P8" x="0.75" y="-1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P6" x="-0.25" y="-1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P5" x="-0.75" y="-1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P14" x="0.25" y="1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P13" x="0.75" y="1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P15" x="-0.25" y="1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<smd name="P16" x="-0.75" y="1.45" dx="0.3" dy="0.8" layer="1" roundness="100"/>
<circle x="-1.45" y="1.45" radius="0.130365625" width="0.3048" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="POE_BUCK">
<wire x1="0" y1="0" x2="10.16" y2="0" width="0.254" layer="100"/>
<wire x1="10.16" y1="0" x2="10.16" y2="20.32" width="0.254" layer="100"/>
<wire x1="10.16" y1="20.32" x2="0" y2="20.32" width="0.254" layer="100"/>
<wire x1="0" y1="20.32" x2="0" y2="0" width="0.254" layer="100"/>
<pin name="+VDC" x="15.24" y="12.7" length="middle" rot="R180"/>
<pin name="-VDC" x="15.24" y="7.62" length="middle" rot="R180"/>
<pin name="VIN+" x="-5.08" y="17.78" length="middle"/>
<pin name="VIN-" x="-5.08" y="2.54" length="middle"/>
<pin name="ADJ" x="5.08" y="25.4" length="middle" rot="R270"/>
</symbol>
<symbol name="J1011F">
<wire x1="1.27" y1="-39.37" x2="0" y2="-41.91" width="0.254" layer="94"/>
<wire x1="0" y1="-41.91" x2="-1.27" y2="-39.37" width="0.254" layer="94"/>
<wire x1="1.27" y1="-41.91" x2="0" y2="-41.91" width="0.254" layer="94"/>
<wire x1="0" y1="-41.91" x2="-1.27" y2="-41.91" width="0.254" layer="94"/>
<wire x1="1.27" y1="-39.37" x2="0" y2="-39.37" width="0.254" layer="94"/>
<wire x1="0" y1="-39.37" x2="-1.27" y2="-39.37" width="0.254" layer="94"/>
<wire x1="0" y1="-39.37" x2="0" y2="-41.91" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-40.132" x2="-3.429" y2="-41.529" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-41.275" x2="-3.302" y2="-42.672" width="0.1524" layer="94"/>
<wire x1="0" y1="-43.18" x2="0" y2="-41.91" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-38.1" x2="0" y2="-38.1" width="0.1524" layer="94"/>
<wire x1="0" y1="-38.1" x2="0" y2="-39.37" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-43.18" x2="0" y2="-43.18" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-49.53" x2="0" y2="-52.07" width="0.254" layer="94"/>
<wire x1="0" y1="-52.07" x2="-1.27" y2="-49.53" width="0.254" layer="94"/>
<wire x1="1.27" y1="-52.07" x2="0" y2="-52.07" width="0.254" layer="94"/>
<wire x1="0" y1="-52.07" x2="-1.27" y2="-52.07" width="0.254" layer="94"/>
<wire x1="1.27" y1="-49.53" x2="0" y2="-49.53" width="0.254" layer="94"/>
<wire x1="0" y1="-49.53" x2="-1.27" y2="-49.53" width="0.254" layer="94"/>
<wire x1="0" y1="-49.53" x2="0" y2="-52.07" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-50.292" x2="-3.429" y2="-51.689" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-51.435" x2="-3.302" y2="-52.832" width="0.1524" layer="94"/>
<wire x1="0" y1="-53.34" x2="0" y2="-52.07" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-48.26" x2="0" y2="-48.26" width="0.1524" layer="94"/>
<wire x1="0" y1="-48.26" x2="0" y2="-49.53" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-53.34" x2="0" y2="-53.34" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="5.08" x2="-12.7" y2="-55.88" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-55.88" x2="2.54" y2="-55.88" width="0.254" layer="94"/>
<wire x1="-12.7" y1="5.08" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<text x="-10.16" y="-40.64" size="1.778" layer="94">YEL</text>
<text x="-10.16" y="-50.8" size="1.778" layer="94">GRN</text>
<text x="-12.7" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-58.42" size="1.778" layer="96">&gt;VALUE</text>
<pin name="YEL-C" x="-15.24" y="-43.18" visible="pad" length="short" direction="pas"/>
<pin name="YEL-A" x="-15.24" y="-38.1" visible="pad" length="short" direction="pas"/>
<pin name="GRN-C" x="-15.24" y="-53.34" visible="pad" length="short" direction="pas"/>
<pin name="GRN-A" x="-15.24" y="-48.26" visible="pad" length="short" direction="pas"/>
<pin name="TD+" x="-15.24" y="2.54" length="short" direction="in"/>
<pin name="CT" x="-15.24" y="-2.54" length="short" direction="in"/>
<pin name="TD-" x="-15.24" y="-7.62" length="short" direction="in"/>
<pin name="RD+" x="-15.24" y="-12.7" length="short" direction="in"/>
<pin name="CR" x="-15.24" y="-17.78" length="short" direction="in"/>
<pin name="RD-" x="-15.24" y="-22.86" length="short" direction="in"/>
<pin name="POE+" x="-15.24" y="-27.94" length="short" direction="in"/>
<pin name="POE-" x="-15.24" y="-33.02" length="short" direction="in"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-41.529"/>
<vertex x="-3.048" y="-40.64"/>
<vertex x="-2.54" y="-41.148"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-42.672"/>
<vertex x="-2.921" y="-41.783"/>
<vertex x="-2.413" y="-42.291"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-51.689"/>
<vertex x="-3.048" y="-50.8"/>
<vertex x="-2.54" y="-51.308"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-52.832"/>
<vertex x="-2.921" y="-51.943"/>
<vertex x="-2.413" y="-52.451"/>
</polygon>
<wire x1="2.54" y1="-55.88" x2="2.54" y2="5.08" width="0.254" layer="94"/>
</symbol>
<symbol name="AG5200">
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="100"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="10.16" width="0.254" layer="100"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="100"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-10.16" width="0.254" layer="100"/>
<pin name="+VDC" x="10.16" y="2.54" length="middle" rot="R180"/>
<pin name="-VDC" x="10.16" y="-2.54" length="middle" rot="R180"/>
<pin name="VIN+" x="-10.16" y="7.62" length="middle"/>
<pin name="VIN-" x="-10.16" y="-7.62" length="middle"/>
<pin name="ADJ" x="0" y="15.24" length="middle" rot="R270"/>
<pin name="AT_DET" x="0" y="-15.24" length="middle" rot="R90"/>
</symbol>
<symbol name="TS30042">
<wire x1="-5.08" y1="12.7" x2="5.08" y2="12.7" width="0.254" layer="94"/>
<wire x1="5.08" y1="12.7" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="-5.08" y2="12.7" width="0.254" layer="94"/>
<pin name="VCC" x="-7.62" y="7.62" visible="pad" length="short"/>
<pin name="EN" x="-7.62" y="-5.08" visible="pad" length="short"/>
<pin name="GND" x="-2.54" y="-12.7" visible="pad" length="short" rot="R90"/>
<pin name="PGND" x="2.54" y="-12.7" visible="pad" length="short" rot="R90"/>
<pin name="PG" x="7.62" y="-5.08" visible="pad" length="short" rot="R180"/>
<pin name="FB" x="7.62" y="0" visible="pad" length="short" rot="R180"/>
<pin name="VSW" x="7.62" y="5.08" visible="pad" length="short" rot="R180"/>
<pin name="BST" x="7.62" y="10.16" visible="pad" length="short" rot="R180"/>
<text x="-4.330684375" y="7.41643125" size="1.27" layer="94">VCC</text>
<text x="-4.511128125" y="-5.3362125" size="1.27" layer="94">EN</text>
<text x="-0.901784375" y="-8.22954375" size="1.27" layer="94" rot="R180">GND</text>
<text x="4.603121875" y="-8.32065" size="1.27" layer="94" rot="R180">PGND</text>
<text x="4.240459375" y="0.814" size="1.27" layer="94" rot="R180">FB</text>
<text x="4.240459375" y="5.969321875" size="1.27" layer="94" rot="R180">VSW</text>
<text x="4.330684375" y="10.8533125" size="1.27" layer="94" rot="R180">BST</text>
<text x="3.87956875" y="15.1946375" size="1.27" layer="94" rot="R180">TS30042</text>
<text x="4.33068125" y="-4.341321875" size="1.27" layer="94" rot="R180">PG</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="SILVERTEL_POE">
<gates>
<gate name="G$1" symbol="POE_BUCK" x="5.08" y="0"/>
</gates>
<devices>
<device name="LARGE" package="AG9800M">
<connects>
<connect gate="G$1" pin="+VDC" pad="V+1 V+2"/>
<connect gate="G$1" pin="-VDC" pad="V-"/>
<connect gate="G$1" pin="ADJ" pad="ADJ"/>
<connect gate="G$1" pin="VIN+" pad="VIN+1 VIN+2"/>
<connect gate="G$1" pin="VIN-" pad="VIN-1 VIN-2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MICRO" package="AG9900">
<connects>
<connect gate="G$1" pin="+VDC" pad="V+1 V+2"/>
<connect gate="G$1" pin="-VDC" pad="V-"/>
<connect gate="G$1" pin="ADJ" pad="ADJ"/>
<connect gate="G$1" pin="VIN+" pad="VIN+1 VIN+2"/>
<connect gate="G$1" pin="VIN-" pad="VIN-1 VIN-2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="J1011F" prefix="X">
<description>&lt;b&gt;PULSEJACK (TM) 1x1 Tab-UP RJ45&lt;/b&gt;&lt;p&gt;
10/100 Base-TX RJ45 1x1 Tab-UP with LEDs 8-pin (J1 series) and 6-pin (JP series) integrated magnetics connector,&lt;br&gt;
designed to support applications, such as ADSL modems, LAN-on-Motherboard, and Hub and Switches.&lt;br&gt;
Source: www.pulseeng.com .. PulseJack-J402.pdf</description>
<gates>
<gate name="G$1" symbol="J1011F" x="0" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="J1">
<connects>
<connect gate="G$1" pin="CR" pad="8"/>
<connect gate="G$1" pin="CT" pad="6"/>
<connect gate="G$1" pin="GRN-A" pad="14"/>
<connect gate="G$1" pin="GRN-C" pad="13"/>
<connect gate="G$1" pin="POE+" pad="2"/>
<connect gate="G$1" pin="POE-" pad="1"/>
<connect gate="G$1" pin="RD+" pad="7"/>
<connect gate="G$1" pin="RD-" pad="5"/>
<connect gate="G$1" pin="TD+" pad="10"/>
<connect gate="G$1" pin="TD-" pad="9"/>
<connect gate="G$1" pin="YEL-A" pad="11"/>
<connect gate="G$1" pin="YEL-C" pad="12"/>
</connects>
<technologies>
<technology name="01P">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
<technology name="21P">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HANRUN" package="HANRUN_POE">
<connects>
<connect gate="G$1" pin="CR" pad="3"/>
<connect gate="G$1" pin="CT" pad="4"/>
<connect gate="G$1" pin="GRN-A" pad="13"/>
<connect gate="G$1" pin="GRN-C" pad="14"/>
<connect gate="G$1" pin="POE+" pad="9"/>
<connect gate="G$1" pin="POE-" pad="10"/>
<connect gate="G$1" pin="RD+" pad="1"/>
<connect gate="G$1" pin="RD-" pad="2"/>
<connect gate="G$1" pin="TD+" pad="5"/>
<connect gate="G$1" pin="TD-" pad="6"/>
<connect gate="G$1" pin="YEL-A" pad="11"/>
<connect gate="G$1" pin="YEL-C" pad="12"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="AG5200">
<gates>
<gate name="G$1" symbol="AG5200" x="0" y="0"/>
</gates>
<devices>
<device name="AG5200" package="AG5200">
<connects>
<connect gate="G$1" pin="+VDC" pad="P$10 P$11"/>
<connect gate="G$1" pin="-VDC" pad="P$7 P$8"/>
<connect gate="G$1" pin="ADJ" pad="P$9"/>
<connect gate="G$1" pin="AT_DET" pad="P$2"/>
<connect gate="G$1" pin="VIN+" pad="P$3 P$4"/>
<connect gate="G$1" pin="VIN-" pad="P$1 P$6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="AG5300" package="AG5300">
<connects>
<connect gate="G$1" pin="+VDC" pad="P$8"/>
<connect gate="G$1" pin="-VDC" pad="P$7 P$10"/>
<connect gate="G$1" pin="ADJ" pad="P$9"/>
<connect gate="G$1" pin="AT_DET" pad="P$3"/>
<connect gate="G$1" pin="VIN+" pad="P$1"/>
<connect gate="G$1" pin="VIN-" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BUCK_CONVERTER">
<gates>
<gate name="G$1" symbol="TS30042" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN-16">
<connects>
<connect gate="G$1" pin="BST" pad="P10"/>
<connect gate="G$1" pin="EN" pad="P9"/>
<connect gate="G$1" pin="FB" pad="P5"/>
<connect gate="G$1" pin="GND" pad="P4"/>
<connect gate="G$1" pin="PG" pad="P8"/>
<connect gate="G$1" pin="PGND" pad="P14 P15 PAD" route="any"/>
<connect gate="G$1" pin="VCC" pad="P2 P3 P11"/>
<connect gate="G$1" pin="VSW" pad="P1 P12 P13 P16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="microbuilder">
<description>&lt;h2&gt;&lt;b&gt;microBuilder.eu&lt;/b&gt; Eagle Footprint Library&lt;/h2&gt;

&lt;p&gt;Footprints for common components used in our projects and products.  This is the same library that we use internally, and it is regularly updated.  The newest version can always be found at &lt;b&gt;www.microBuilder.eu&lt;/b&gt;.  If you find this library useful, please feel free to purchase something from our online store. Please also note that all holes are optimised for metric drill bits!&lt;/p&gt;

&lt;h3&gt;Obligatory Warning&lt;/h3&gt;
&lt;p&gt;While it probably goes without saying, there are no guarantees that the footprints or schematic symbols in this library are flawless, and we make no promises of fitness for production, prototyping or any other purpose. These libraries are provided for information puposes only, and are used at your own discretion.  While we make every effort to produce accurate footprints, and many of the items found in this library have be proven in production, we can't make any promises of suitability for a specific purpose. If you do find any errors, though, please feel free to contact us at www.microbuilder.eu to let us know about it so that we can update the library accordingly!&lt;/p&gt;

&lt;h3&gt;License&lt;/h3&gt;
&lt;p&gt;This work is placed in the public domain, and may be freely used for commercial and non-commercial work with the following conditions:&lt;/p&gt;
&lt;p&gt;THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
&lt;/p&gt;</description>
<packages>
<package name="0603-MINI">
<description>0603-Mini
&lt;p&gt;Mini footprint for dense boards&lt;/p&gt;</description>
<wire x1="-1.346" y1="0.583" x2="1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="0.583" x2="1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="-0.583" x2="-1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="-1.346" y1="-0.583" x2="-1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="-1.45" y1="-0.7" x2="-1.45" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-1.45" y1="0.7" x2="1.45" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.45" y1="0.7" x2="1.45" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="1.45" y1="-0.7" x2="-1.45" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<text x="1.524" y="-0.0635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.524" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
</package>
<package name="0805_NOTHERMALS">
<wire x1="-1.873" y1="0.883" x2="1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="1.873" y1="-0.883" x2="-1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="-1.873" y1="-0.883" x2="-1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.873" y1="0.883" x2="1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="1.85" y1="1" x2="1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1" x2="-1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="-1" x2="-1.85" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="1" x2="1.85" y2="1" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
</package>
<package name="_0402">
<description>&lt;b&gt; 0402&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="-1.0573" y1="0.5557" x2="1.0573" y2="0.5557" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="0.5557" x2="1.0573" y2="-0.5556" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="-0.5556" x2="-1.0573" y2="-0.5557" width="0.2032" layer="21"/>
<wire x1="-1.0573" y1="-0.5557" x2="-1.0573" y2="0.5557" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<text x="-0.9525" y="0.7939" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-1.3336" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.0794" y1="-0.2381" x2="0.0794" y2="0.2381" layer="35"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
</package>
<package name="_0402MP">
<description>&lt;b&gt;0402 MicroPitch&lt;p&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="0" y1="0.127" x2="0" y2="-0.127" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-0.635" y="0.4763" size="0.6096" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.635" y="-0.7938" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.1" y1="-0.2" x2="0.1" y2="0.2" layer="35"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.254" y2="0.25" layer="51"/>
<rectangle x1="0.2588" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
</package>
<package name="_0603">
<description>&lt;b&gt;0603&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="-1.4605" y1="0.635" x2="1.4605" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="0.635" x2="1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="-0.635" x2="-1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.4605" y1="-0.635" x2="-1.4605" y2="0.635" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<text x="-1.27" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.27" y="-1.4923" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8382" y2="0.4" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="_0603MP">
<description>&lt;b&gt;0603 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="0" y1="0.254" x2="0" y2="-0.254" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.9525" y="0.635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-0.9525" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.25" x2="0.1999" y2="0.25" layer="35"/>
</package>
<package name="_0805">
<description>&lt;b&gt;0805&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.585" x2="0.41" y2="0.585" width="0.1016" layer="51"/>
<wire x1="-0.41" y1="-0.585" x2="0.41" y2="-0.585" width="0.1016" layer="51"/>
<wire x1="-1.905" y1="0.889" x2="1.905" y2="0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="0.889" x2="1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-0.889" x2="-1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="-1.905" y1="-0.889" x2="-1.905" y2="0.889" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="1.27" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5874" y="-1.651" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1.0564" y2="0.65" layer="51"/>
<rectangle x1="-1.0668" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="_0805MP">
<description>&lt;b&gt;0805 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.51" y1="0.535" x2="0.51" y2="0.535" width="0.1016" layer="51"/>
<wire x1="-0.51" y1="-0.535" x2="0.51" y2="-0.535" width="0.1016" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5875" y="-1.27" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1" y2="0.65" layer="51"/>
<rectangle x1="-1" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="0805_10MGAP">
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<smd name="1" x="-1.05" y="0" dx="1.2" dy="1.5" layer="1"/>
<smd name="2" x="1.05" y="0" dx="1.2" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.3048" layer="21"/>
</package>
<package name="_1206">
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1016" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1016" layer="51"/>
<wire x1="-2.286" y1="1.143" x2="2.286" y2="1.143" width="0.2032" layer="21"/>
<wire x1="2.286" y1="1.143" x2="2.286" y2="-1.143" width="0.2032" layer="21"/>
<wire x1="2.286" y1="-1.143" x2="-2.286" y2="-1.143" width="0.2032" layer="21"/>
<wire x1="-2.286" y1="-1.143" x2="-2.286" y2="1.143" width="0.2032" layer="21"/>
<smd name="2" x="1.27" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="1" x="-1.27" y="0" dx="1.4" dy="1.8" layer="1"/>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<text x="-2.2225" y="1.5113" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.2225" y="-1.8288" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="_1206MP">
<wire x1="1.0525" y1="-0.7128" x2="-1.0652" y2="-0.7128" width="0.1016" layer="51"/>
<wire x1="1.0525" y1="0.7128" x2="-1.0652" y2="0.7128" width="0.1016" layer="51"/>
<wire x1="-0.635" y1="0.635" x2="0.635" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-0.635" x2="0.635" y2="-0.635" width="0.2032" layer="21"/>
<smd name="2" x="1.524" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="1" x="-1.524" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-2.2225" y="1.1113" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.2225" y="-1.4288" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-0.8" x2="-0.9" y2="0.8" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<rectangle x1="0.9001" y1="-0.8" x2="1.6" y2="0.8" layer="51" rot="R180"/>
</package>
<package name="PANASONIC_C">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package C&lt;/b&gt;</description>
<wire x1="-2.6" y1="2.6" x2="1.25" y2="2.6" width="0.1016" layer="51"/>
<wire x1="1.25" y1="2.6" x2="2.6" y2="1.25" width="0.1016" layer="51"/>
<wire x1="2.6" y1="1.25" x2="2.6" y2="-1.25" width="0.1016" layer="51"/>
<wire x1="2.6" y1="-1.25" x2="1.25" y2="-2.6" width="0.1016" layer="51"/>
<wire x1="1.25" y1="-2.6" x2="-2.6" y2="-2.6" width="0.1016" layer="51"/>
<wire x1="-2.6" y1="-2.6" x2="-2.6" y2="2.6" width="0.1016" layer="51"/>
<wire x1="-2.6" y1="0.95" x2="-2.6" y2="2.6" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="2.6" x2="1.25" y2="2.6" width="0.2032" layer="21"/>
<wire x1="1.25" y1="2.6" x2="2.6" y2="1.25" width="0.2032" layer="21"/>
<wire x1="2.6" y1="1.25" x2="2.6" y2="0.95" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-0.95" x2="2.6" y2="-1.25" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-1.25" x2="1.25" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="1.25" y1="-2.6" x2="-2.6" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="-2.6" x2="-2.6" y2="-0.95" width="0.2032" layer="21"/>
<wire x1="-1.55" y1="1.85" x2="-1.55" y2="-1.85" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="2.45" width="0.1016" layer="51"/>
<smd name="-" x="-2.05" y="0" dx="2.6" dy="1.4" layer="1"/>
<smd name="+" x="2.05" y="0" dx="2.6" dy="1.4" layer="1"/>
<text x="-2.54" y="2.794" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.54" y="-3.683" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.95" y1="-0.35" x2="-2.4" y2="0.35" layer="51"/>
<rectangle x1="2.4" y1="-0.35" x2="2.95" y2="0.35" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-1.6" y="1.8"/>
<vertex x="-2" y="1.35"/>
<vertex x="-2.25" y="0.75"/>
<vertex x="-2.45" y="0.05"/>
<vertex x="-2.25" y="-0.75"/>
<vertex x="-1.95" y="-1.35"/>
<vertex x="-1.6" y="-1.8"/>
</polygon>
</package>
<package name="PANASONIC_D">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package D&lt;/b&gt;</description>
<wire x1="-3.25" y1="3.25" x2="1.55" y2="3.25" width="0.1016" layer="51"/>
<wire x1="1.55" y1="3.25" x2="3.25" y2="1.55" width="0.1016" layer="51"/>
<wire x1="3.25" y1="1.55" x2="3.25" y2="-1.55" width="0.1016" layer="51"/>
<wire x1="3.25" y1="-1.55" x2="1.55" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="1.55" y1="-3.25" x2="-3.25" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="-3.25" y1="-3.25" x2="-3.25" y2="3.25" width="0.1016" layer="51"/>
<wire x1="-3.25" y1="0.95" x2="-3.25" y2="3.25" width="0.2032" layer="21"/>
<wire x1="-3.25" y1="3.25" x2="1.55" y2="3.25" width="0.2032" layer="21"/>
<wire x1="1.55" y1="3.25" x2="3.25" y2="1.55" width="0.2032" layer="21"/>
<wire x1="3.25" y1="1.55" x2="3.25" y2="0.95" width="0.2032" layer="21"/>
<wire x1="3.25" y1="-0.95" x2="3.25" y2="-1.55" width="0.2032" layer="21"/>
<wire x1="3.25" y1="-1.55" x2="1.55" y2="-3.25" width="0.2032" layer="21"/>
<wire x1="1.55" y1="-3.25" x2="-3.25" y2="-3.25" width="0.2032" layer="21"/>
<wire x1="-3.25" y1="-3.25" x2="-3.25" y2="-0.95" width="0.2032" layer="21"/>
<wire x1="-2.1" y1="2.25" x2="-2.1" y2="-2.2" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="3.1" width="0.1016" layer="51"/>
<smd name="-" x="-2.654" y="0" dx="3.556" dy="1.4" layer="1"/>
<smd name="+" x="2.654" y="0" dx="3.556" dy="1.4" layer="1"/>
<text x="-3.02" y="3.54" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.048" y="-4.318" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.65" y1="-0.35" x2="-3.05" y2="0.35" layer="51"/>
<rectangle x1="3.05" y1="-0.35" x2="3.65" y2="0.35" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-2.15" y="2.15"/>
<vertex x="-2.6" y="1.6"/>
<vertex x="-2.9" y="0.9"/>
<vertex x="-3.05" y="0"/>
<vertex x="-2.9" y="-0.95"/>
<vertex x="-2.55" y="-1.65"/>
<vertex x="-2.15" y="-2.15"/>
<vertex x="-2.15" y="2.1"/>
</polygon>
</package>
<package name="CELEC_3.5MM_8MM">
<description>&lt;b&gt;ELECTROLYTIC CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 3.5 mm, diameter 8 mm</description>
<wire x1="-3.429" y1="1.143" x2="-2.667" y2="1.143" width="0.2032" layer="21"/>
<wire x1="-3.048" y1="0.762" x2="-3.048" y2="1.524" width="0.2032" layer="21"/>
<wire x1="-1.651" y1="0" x2="-0.762" y2="0" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="-1.27" x2="-0.254" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="-1.27" x2="-0.254" y2="1.27" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="1.27" x2="-0.762" y2="1.27" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="1.27" x2="-0.762" y2="0" width="0.2032" layer="51"/>
<wire x1="0.635" y1="0" x2="1.651" y2="0" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="4.064" width="0.2032" layer="21"/>
<pad name="-" x="1.778" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="+" x="-1.778" y="0" drill="0.8128" diameter="1.6002"/>
<text x="4.572" y="0" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="4.572" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.254" y1="-1.27" x2="0.762" y2="1.27" layer="51"/>
</package>
<package name="CELEC_3.5MM_10MM">
<description>&lt;b&gt;ELECTROLYTIC CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 3.5 mm, diameter 10 mm</description>
<wire x1="-3.429" y1="1.143" x2="-2.667" y2="1.143" width="0.2032" layer="21"/>
<wire x1="-3.048" y1="0.762" x2="-3.048" y2="1.524" width="0.2032" layer="21"/>
<wire x1="-1.651" y1="0" x2="-0.762" y2="0" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="-1.27" x2="-0.254" y2="-1.27" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="-1.27" x2="-0.254" y2="1.27" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="1.27" x2="-0.762" y2="1.27" width="0.2032" layer="51"/>
<wire x1="-0.762" y1="1.27" x2="-0.762" y2="0" width="0.2032" layer="51"/>
<wire x1="0.635" y1="0" x2="1.651" y2="0" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="5.08" width="0.2032" layer="21"/>
<pad name="-" x="1.778" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="+" x="-1.778" y="0" drill="0.8128" diameter="1.6002"/>
<text x="5.588" y="0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="5.588" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.254" y1="-1.27" x2="0.762" y2="1.27" layer="51"/>
</package>
<package name="TQFP44">
<wire x1="-4.8" y1="4.4" x2="-4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="4.8" x2="4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.8" x2="4.8" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="4.4" x2="4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="-4.4" x2="4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.8" x2="-4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.8" x2="-4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.8" y1="-4.4" x2="-4.8" y2="4.4" width="0.2032" layer="21"/>
<circle x="-4" y="4" radius="0.2827" width="0.254" layer="21"/>
<smd name="1" x="-5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="2" x="-5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="3" x="-5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="4" x="-5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="5" x="-5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="6" x="-5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="7" x="-5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="8" x="-5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="9" x="-5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="10" x="-5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="11" x="-5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="12" x="-4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="13" x="-3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="14" x="-2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="15" x="-1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="16" x="-0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="17" x="0" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="18" x="0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="19" x="1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="20" x="2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="21" x="3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="22" x="4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="23" x="5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="24" x="5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="25" x="5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="26" x="5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="27" x="5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="28" x="5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="29" x="5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="30" x="5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="31" x="5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="32" x="5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="33" x="5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="34" x="4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="35" x="3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="36" x="2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="37" x="1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="38" x="0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="39" x="0" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="40" x="-0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="41" x="-1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="42" x="-2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="43" x="-3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="44" x="-4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<text x="-3.81" y="6.985" size="1.778" layer="25">&gt;NAME</text>
<text x="-4.445" y="-8.7551" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="-6.1001" y1="3.8001" x2="-4.95" y2="4.1999" layer="51"/>
<rectangle x1="-6.1001" y1="3" x2="-4.95" y2="3.4" layer="51"/>
<rectangle x1="-6.1001" y1="2.1999" x2="-4.95" y2="2.5999" layer="51"/>
<rectangle x1="-6.1001" y1="1.4" x2="-4.95" y2="1.8001" layer="51"/>
<rectangle x1="-6.1001" y1="0.5999" x2="-4.95" y2="1" layer="51"/>
<rectangle x1="-6.1001" y1="-0.1999" x2="-4.95" y2="0.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-1" x2="-4.95" y2="-0.5999" layer="51"/>
<rectangle x1="-6.1001" y1="-1.8001" x2="-4.95" y2="-1.4" layer="51"/>
<rectangle x1="-6.1001" y1="-2.5999" x2="-4.95" y2="-2.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-3.4" x2="-4.95" y2="-3" layer="51"/>
<rectangle x1="-6.1001" y1="-4.1999" x2="-4.95" y2="-3.8001" layer="51"/>
<rectangle x1="-4.1999" y1="-6.1001" x2="-3.8001" y2="-4.95" layer="51"/>
<rectangle x1="-3.4" y1="-6.1001" x2="-3" y2="-4.95" layer="51"/>
<rectangle x1="-2.5999" y1="-6.1001" x2="-2.1999" y2="-4.95" layer="51"/>
<rectangle x1="-1.8001" y1="-6.1001" x2="-1.4" y2="-4.95" layer="51"/>
<rectangle x1="-1" y1="-6.1001" x2="-0.5999" y2="-4.95" layer="51"/>
<rectangle x1="-0.1999" y1="-6.1001" x2="0.1999" y2="-4.95" layer="51"/>
<rectangle x1="0.5999" y1="-6.1001" x2="1" y2="-4.95" layer="51"/>
<rectangle x1="1.4" y1="-6.1001" x2="1.8001" y2="-4.95" layer="51"/>
<rectangle x1="2.1999" y1="-6.1001" x2="2.5999" y2="-4.95" layer="51"/>
<rectangle x1="3" y1="-6.1001" x2="3.4" y2="-4.95" layer="51"/>
<rectangle x1="3.8001" y1="-6.1001" x2="4.1999" y2="-4.95" layer="51"/>
<rectangle x1="4.95" y1="-4.1999" x2="6.1001" y2="-3.8001" layer="51"/>
<rectangle x1="4.95" y1="-3.4" x2="6.1001" y2="-3" layer="51"/>
<rectangle x1="4.95" y1="-2.5999" x2="6.1001" y2="-2.1999" layer="51"/>
<rectangle x1="4.95" y1="-1.8001" x2="6.1001" y2="-1.4" layer="51"/>
<rectangle x1="4.95" y1="-1" x2="6.1001" y2="-0.5999" layer="51"/>
<rectangle x1="4.95" y1="-0.1999" x2="6.1001" y2="0.1999" layer="51"/>
<rectangle x1="4.95" y1="0.5999" x2="6.1001" y2="1" layer="51"/>
<rectangle x1="4.95" y1="1.4" x2="6.1001" y2="1.8001" layer="51"/>
<rectangle x1="4.95" y1="2.1999" x2="6.1001" y2="2.5999" layer="51"/>
<rectangle x1="4.95" y1="3" x2="6.1001" y2="3.4" layer="51"/>
<rectangle x1="4.95" y1="3.8001" x2="6.1001" y2="4.1999" layer="51"/>
<rectangle x1="3.8001" y1="4.95" x2="4.1999" y2="6.1001" layer="51"/>
<rectangle x1="3" y1="4.95" x2="3.4" y2="6.1001" layer="51"/>
<rectangle x1="2.1999" y1="4.95" x2="2.5999" y2="6.1001" layer="51"/>
<rectangle x1="1.4" y1="4.95" x2="1.8001" y2="6.1001" layer="51"/>
<rectangle x1="0.5999" y1="4.95" x2="1" y2="6.1001" layer="51"/>
<rectangle x1="-0.1999" y1="4.95" x2="0.1999" y2="6.1001" layer="51"/>
<rectangle x1="-1" y1="4.95" x2="-0.5999" y2="6.1001" layer="51"/>
<rectangle x1="-1.8001" y1="4.95" x2="-1.4" y2="6.1001" layer="51"/>
<rectangle x1="-2.5999" y1="4.95" x2="-2.1999" y2="6.1001" layer="51"/>
<rectangle x1="-3.4" y1="4.95" x2="-3" y2="6.1001" layer="51"/>
<rectangle x1="-4.1999" y1="4.95" x2="-3.8001" y2="6.1001" layer="51"/>
</package>
<package name="TQFN44_7MM">
<description>&lt;p&gt;&lt;b&gt;Source: &lt;/b&gt;http://datasheets.maxim-ic.com/en/ds/MAX9744.pdf&lt;/p&gt;</description>
<wire x1="-3.5" y1="3.5" x2="3.5" y2="3.5" width="0.127" layer="51"/>
<wire x1="3.5" y1="3.5" x2="3.5" y2="-3.5" width="0.127" layer="51"/>
<wire x1="3.5" y1="-3.5" x2="-3.5" y2="-3.5" width="0.127" layer="51"/>
<wire x1="-3.5" y1="-3.5" x2="-3.5" y2="3.5" width="0.127" layer="51"/>
<smd name="1" x="-2.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="2" x="-2" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="3" x="-1.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="4" x="-1" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="5" x="-0.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="6" x="0" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="7" x="0.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="8" x="1" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="9" x="1.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="10" x="2" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="11" x="2.5" y="-3.475" dx="0.8" dy="0.25" layer="1" rot="R90"/>
<smd name="12" x="3.475" y="-2.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="13" x="3.475" y="-2" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="14" x="3.475" y="-1.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="15" x="3.475" y="-1" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="16" x="3.475" y="-0.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="17" x="3.475" y="0" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="18" x="3.475" y="0.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="19" x="3.475" y="1" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="20" x="3.475" y="1.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="21" x="3.475" y="2" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="22" x="3.475" y="2.5" dx="0.8" dy="0.25" layer="1" rot="R180"/>
<smd name="23" x="2.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="24" x="2" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="25" x="1.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="26" x="1" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="27" x="0.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="28" x="0" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="29" x="-0.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="30" x="-1" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="31" x="-1.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="32" x="-2" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="33" x="-2.5" y="3.475" dx="0.8" dy="0.25" layer="1" rot="R270"/>
<smd name="34" x="-3.475" y="2.5" dx="0.8" dy="0.25" layer="1"/>
<smd name="35" x="-3.475" y="2" dx="0.8" dy="0.25" layer="1"/>
<smd name="36" x="-3.475" y="1.5" dx="0.8" dy="0.25" layer="1"/>
<smd name="37" x="-3.475" y="1" dx="0.8" dy="0.25" layer="1"/>
<smd name="38" x="-3.475" y="0.5" dx="0.8" dy="0.25" layer="1"/>
<smd name="39" x="-3.475" y="0" dx="0.8" dy="0.25" layer="1"/>
<smd name="40" x="-3.475" y="-0.5" dx="0.8" dy="0.25" layer="1"/>
<smd name="41" x="-3.475" y="-1" dx="0.8" dy="0.25" layer="1"/>
<smd name="42" x="-3.475" y="-1.5" dx="0.8" dy="0.25" layer="1"/>
<smd name="43" x="-3.475" y="-2" dx="0.8" dy="0.25" layer="1"/>
<smd name="44" x="-3.475" y="-2.5" dx="0.8" dy="0.25" layer="1"/>
<rectangle x1="-3.5" y1="2.375" x2="-2.95" y2="2.625" layer="51"/>
<rectangle x1="-3.5" y1="1.875" x2="-2.95" y2="2.125" layer="51"/>
<rectangle x1="-3.5" y1="1.375" x2="-2.95" y2="1.625" layer="51"/>
<rectangle x1="-3.5" y1="0.875" x2="-2.95" y2="1.125" layer="51"/>
<rectangle x1="-3.5" y1="0.375" x2="-2.95" y2="0.625" layer="51"/>
<rectangle x1="-3.5" y1="-0.125" x2="-2.95" y2="0.125" layer="51"/>
<rectangle x1="-3.5" y1="-0.625" x2="-2.95" y2="-0.375" layer="51"/>
<rectangle x1="-3.5" y1="-1.125" x2="-2.95" y2="-0.875" layer="51"/>
<rectangle x1="-3.5" y1="-1.625" x2="-2.95" y2="-1.375" layer="51"/>
<rectangle x1="-3.5" y1="-2.125" x2="-2.95" y2="-1.875" layer="51"/>
<rectangle x1="-3.5" y1="-2.625" x2="-2.95" y2="-2.375" layer="51"/>
<rectangle x1="-2.775" y1="-3.35" x2="-2.225" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="-2.275" y1="-3.35" x2="-1.725" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="-1.775" y1="-3.35" x2="-1.225" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="-1.275" y1="-3.35" x2="-0.725" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="-0.775" y1="-3.35" x2="-0.225" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="-0.275" y1="-3.35" x2="0.275" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="0.225" y1="-3.35" x2="0.775" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="0.725" y1="-3.35" x2="1.275" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="1.225" y1="-3.35" x2="1.775" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="1.725" y1="-3.35" x2="2.275" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="2.225" y1="-3.35" x2="2.775" y2="-3.1" layer="51" rot="R90"/>
<rectangle x1="2.95" y1="-2.625" x2="3.5" y2="-2.375" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="-2.125" x2="3.5" y2="-1.875" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="-1.625" x2="3.5" y2="-1.375" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="-1.125" x2="3.5" y2="-0.875" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="-0.625" x2="3.5" y2="-0.375" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="-0.125" x2="3.5" y2="0.125" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="0.375" x2="3.5" y2="0.625" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="0.875" x2="3.5" y2="1.125" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="1.375" x2="3.5" y2="1.625" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="1.875" x2="3.5" y2="2.125" layer="51" rot="R180"/>
<rectangle x1="2.95" y1="2.375" x2="3.5" y2="2.625" layer="51" rot="R180"/>
<rectangle x1="2.225" y1="3.1" x2="2.775" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="1.725" y1="3.1" x2="2.275" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="1.225" y1="3.1" x2="1.775" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="0.725" y1="3.1" x2="1.275" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="0.225" y1="3.1" x2="0.775" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-0.275" y1="3.1" x2="0.275" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-0.775" y1="3.1" x2="-0.225" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-1.275" y1="3.1" x2="-0.725" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-1.775" y1="3.1" x2="-1.225" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-2.275" y1="3.1" x2="-1.725" y2="3.35" layer="51" rot="R270"/>
<rectangle x1="-2.775" y1="3.1" x2="-2.225" y2="3.35" layer="51" rot="R270"/>
<text x="-2.6" y="4.4" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<circle x="-3.878" y="-3.932" radius="0.127" width="0.4064" layer="21"/>
<text x="-3" y="-4.7" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-2.8" y1="3.6" x2="-3.6" y2="3.6" width="0.127" layer="21"/>
<wire x1="-3.6" y1="3.6" x2="-3.6" y2="2.8" width="0.127" layer="21"/>
<wire x1="2.8" y1="3.6" x2="3.6" y2="3.6" width="0.127" layer="21"/>
<wire x1="3.6" y1="3.6" x2="3.6" y2="2.8" width="0.127" layer="21"/>
<wire x1="-3.6" y1="-2.8" x2="-3.6" y2="-3.6" width="0.127" layer="21"/>
<wire x1="-3.6" y1="-3.6" x2="-2.8" y2="-3.6" width="0.127" layer="21"/>
<wire x1="3.6" y1="-2.8" x2="3.6" y2="-3.6" width="0.127" layer="21"/>
<wire x1="3.6" y1="-3.6" x2="2.8" y2="-3.6" width="0.127" layer="21"/>
<smd name="THERMAL" x="0" y="0" dx="4.7" dy="4.7" layer="1" cream="no"/>
<rectangle x1="-2" y1="0.5" x2="-1" y2="2" layer="31"/>
<rectangle x1="-0.5" y1="0.5" x2="0.5" y2="2" layer="31"/>
<rectangle x1="1" y1="0.5" x2="2" y2="2" layer="31"/>
<rectangle x1="1" y1="-2" x2="2" y2="-0.5" layer="31"/>
<rectangle x1="-0.5" y1="-2" x2="0.5" y2="-0.5" layer="31"/>
<rectangle x1="-2" y1="-2" x2="-1" y2="-0.5" layer="31"/>
</package>
<package name="2012">
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.2032" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.2032" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-3.302" y1="1.524" x2="3.302" y2="1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="1.524" x2="3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="-1.524" x2="-3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="-3.302" y1="-1.524" x2="-3.302" y2="1.524" width="0.2032" layer="21"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-2.54" y="1.8415" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.667" y="-2.159" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="2512">
<description>&lt;b&gt;RESISTOR 2512 (Metric 6432)&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.2032" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.2032" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-3.683" y="1.905" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.556" y="-2.286" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="SOT23-5">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt; - 5 Pin</description>
<wire x1="1.4224" y1="0.8104" x2="1.4224" y2="-0.8104" width="0.2032" layer="51"/>
<wire x1="1.4224" y1="-0.8104" x2="-1.4224" y2="-0.8104" width="0.2032" layer="51"/>
<wire x1="-1.4224" y1="-0.8104" x2="-1.4224" y2="0.8104" width="0.2032" layer="51"/>
<wire x1="-1.4224" y1="0.8104" x2="1.4224" y2="0.8104" width="0.2032" layer="51"/>
<wire x1="-1.65" y1="0.8" x2="-1.65" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="1.65" y1="0.8" x2="1.65" y2="-0.8" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="3" x="0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="4" x="0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="5" x="-0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<text x="1.978" y="0" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.978" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.85" layer="51"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="0.85" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.85" x2="-0.7" y2="1.5" layer="51"/>
<wire x1="-0.4" y1="1.05" x2="0.4" y2="1.05" width="0.2032" layer="21"/>
</package>
<package name="CHIPLED_1206">
<description>&lt;b&gt;CHIPLED 1206&lt;/b&gt;</description>
<wire x1="-0.4" y1="1.6" x2="0.4" y2="1.6" width="0.1016" layer="51" curve="172.619069"/>
<wire x1="-0.8" y1="-0.95" x2="-0.8" y2="0.95" width="0.1016" layer="51"/>
<wire x1="0.8" y1="0.95" x2="0.8" y2="-0.95" width="0.1016" layer="51"/>
<wire x1="-0.6" y1="0.446" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="0.6" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="-0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="-0.154" x2="0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-0.154" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="1" y1="2.4985" x2="-1" y2="2.4985" width="0.2032" layer="21"/>
<wire x1="-1" y1="2.4985" x2="-1" y2="-2.4985" width="0.2032" layer="21"/>
<wire x1="-1" y1="-2.4985" x2="1" y2="-2.4985" width="0.2032" layer="21"/>
<wire x1="1" y1="-2.4985" x2="1" y2="2.4985" width="0.2032" layer="21"/>
<circle x="-0.55" y="1.425" radius="0.1" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.496" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="0" y="-1.496" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.27" y="-2.286" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.651" y="-2.286" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-2.23" size="0.4064" layer="51">A</text>
<text x="-0.1" y="1.86" size="0.4064" layer="51">C</text>
<rectangle x1="-0.85" y1="1.525" x2="-0.35" y2="1.65" layer="51"/>
<rectangle x1="-0.85" y1="1.225" x2="-0.625" y2="1.55" layer="51"/>
<rectangle x1="-0.45" y1="1.225" x2="-0.325" y2="1.45" layer="51"/>
<rectangle x1="-0.65" y1="1.225" x2="-0.225" y2="1.35" layer="51"/>
<rectangle x1="0.35" y1="1.3" x2="0.85" y2="1.65" layer="51"/>
<rectangle x1="0.25" y1="1.225" x2="0.85" y2="1.35" layer="51"/>
<rectangle x1="-0.85" y1="0.95" x2="0.85" y2="1.25" layer="51"/>
<rectangle x1="-0.85" y1="-1.65" x2="0.85" y2="-0.95" layer="51"/>
</package>
<package name="CHIPLED_0805">
<description>&lt;b&gt;CHIPLED 0805&lt;/b&gt;</description>
<wire x1="-0.35" y1="0.925" x2="0.35" y2="0.925" width="0.1016" layer="51" curve="162.394521"/>
<wire x1="-0.35" y1="-0.925" x2="0.35" y2="-0.925" width="0.1016" layer="51" curve="-162.394521"/>
<wire x1="0.575" y1="0.525" x2="0.575" y2="-0.525" width="0.1016" layer="51"/>
<wire x1="-0.575" y1="-0.5" x2="-0.575" y2="0.925" width="0.1016" layer="51"/>
<wire x1="-0.4" y1="0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="0.4" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="-0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="0.4" y1="-0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0.85" y1="-1.9" x2="-0.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="-1.9" x2="-0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="1.9" x2="0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="0.85" y1="1.9" x2="0.85" y2="-1.9" width="0.2032" layer="21"/>
<circle x="-0.45" y="0.85" radius="0.103" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.016" y="-1.778" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.397" y="-1.778" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-1.4" size="0.254" layer="51">A</text>
<text x="-0.1" y="1.2" size="0.254" layer="51">C</text>
<rectangle x1="0.3" y1="0.5" x2="0.625" y2="1" layer="51"/>
<rectangle x1="-0.325" y1="0.5" x2="-0.175" y2="0.75" layer="51"/>
<rectangle x1="0.175" y1="0.5" x2="0.325" y2="0.75" layer="51"/>
<rectangle x1="-0.2" y1="0.5" x2="0.2" y2="0.675" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.625" y2="-0.5" layer="51"/>
<rectangle x1="-0.625" y1="-1" x2="-0.3" y2="-0.5" layer="51"/>
<rectangle x1="0.175" y1="-0.75" x2="0.325" y2="-0.5" layer="51"/>
<rectangle x1="-0.325" y1="-0.75" x2="-0.175" y2="-0.5" layer="51"/>
<rectangle x1="-0.2" y1="-0.675" x2="0.2" y2="-0.5" layer="51"/>
<rectangle x1="-0.6" y1="0.5" x2="-0.3" y2="0.762" layer="51"/>
<rectangle x1="-0.625" y1="0.925" x2="-0.3" y2="1" layer="51"/>
</package>
<package name="CHIPLED_0603">
<description>&lt;b&gt;CHIPLED 0603&lt;/b&gt;</description>
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="-0.65" y1="-1.4" x2="-0.65" y2="1.4" width="0.2032" layer="21"/>
<wire x1="0.65" y1="1.4" x2="0.65" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-0.65" y1="1.4" x2="0.65" y2="1.4" width="0.2032" layer="21"/>
<wire x1="-0.65" y1="-1.4" x2="0.65" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="0.4" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="-0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="0.4" y1="-0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.762" y="-1.27" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.27" y="-1.27" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
</package>
<package name="CHIPLED_0603_NOOUTLINE">
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.762" y="-1.27" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.27" y="-1.27" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
<rectangle x1="-0.381" y1="0.1397" x2="0.381" y2="0.2667" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0" y="0.1397"/>
<vertex x="-0.254" y="-0.1778"/>
<vertex x="0.254" y="-0.1778"/>
</polygon>
</package>
<package name="CHIPLED_0805_NOOUTLINE">
<wire x1="-0.35" y1="0.925" x2="0.35" y2="0.925" width="0.1016" layer="51" curve="162.394521"/>
<wire x1="-0.35" y1="-0.925" x2="0.35" y2="-0.925" width="0.1016" layer="51" curve="-162.394521"/>
<wire x1="0.575" y1="0.525" x2="0.575" y2="-0.525" width="0.1016" layer="51"/>
<wire x1="-0.575" y1="-0.5" x2="-0.575" y2="0.925" width="0.1016" layer="51"/>
<circle x="-0.45" y="0.85" radius="0.103" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.016" y="-1.778" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.397" y="-1.778" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-1.4" size="0.254" layer="51">A</text>
<text x="-0.1" y="1.2" size="0.254" layer="51">C</text>
<rectangle x1="0.3" y1="0.5" x2="0.625" y2="1" layer="51"/>
<rectangle x1="-0.325" y1="0.5" x2="-0.175" y2="0.75" layer="51"/>
<rectangle x1="0.175" y1="0.5" x2="0.325" y2="0.75" layer="51"/>
<rectangle x1="-0.2" y1="0.5" x2="0.2" y2="0.675" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.625" y2="-0.5" layer="51"/>
<rectangle x1="-0.625" y1="-1" x2="-0.3" y2="-0.5" layer="51"/>
<rectangle x1="0.175" y1="-0.75" x2="0.325" y2="-0.5" layer="51"/>
<rectangle x1="-0.325" y1="-0.75" x2="-0.175" y2="-0.5" layer="51"/>
<rectangle x1="-0.2" y1="-0.675" x2="0.2" y2="-0.5" layer="51"/>
<rectangle x1="-0.6" y1="0.5" x2="-0.3" y2="0.762" layer="51"/>
<rectangle x1="-0.625" y1="0.925" x2="-0.3" y2="1" layer="51"/>
<rectangle x1="-0.4445" y1="0.1405" x2="0.4445" y2="0.331" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0" y="0.254"/>
<vertex x="-0.381" y="-0.254"/>
<vertex x="0.381" y="-0.254"/>
</polygon>
</package>
<package name="CREE_XLAMP_XPE2">
<description>&lt;p&gt;Source: http://www.cree.com/~/media/Files/Cree/LED%20Components%20and%20Modules/XLamp/Data%20and%20Binning/XLampXPE2.pdf&lt;/p&gt;</description>
<smd name="CATHODE" x="-1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="ANODE" x="1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="THERMAL" x="0" y="0" dx="1.3" dy="3.3" layer="1" cream="no"/>
<rectangle x1="-2.05" y1="-0.25" x2="-1.15" y2="0.25" layer="1"/>
<rectangle x1="-2.1" y1="-0.3" x2="-1.15" y2="0.3" layer="29"/>
<rectangle x1="1.15" y1="-0.25" x2="2.05" y2="0.25" layer="1" rot="R180"/>
<rectangle x1="1.15" y1="-0.3" x2="2.1" y2="0.3" layer="29" rot="R180"/>
<rectangle x1="-0.6" y1="-1.6" x2="0.6" y2="1.6" layer="31"/>
<rectangle x1="-2" y1="-0.2" x2="-1.2" y2="0.2" layer="31"/>
<rectangle x1="-1.6" y1="0.2" x2="-1.2" y2="1.6" layer="31"/>
<rectangle x1="-1.6" y1="-1.6" x2="-1.2" y2="-0.2" layer="31"/>
<rectangle x1="1.2" y1="-0.2" x2="2" y2="0.2" layer="31"/>
<rectangle x1="1.2" y1="0.2" x2="1.6" y2="1.6" layer="31"/>
<rectangle x1="1.2" y1="-1.6" x2="1.6" y2="-0.2" layer="31"/>
<wire x1="-1.725" y1="1.725" x2="1.725" y2="1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="1.725" x2="1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="-1.725" x2="-1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="-1.725" y1="-1.725" x2="-1.725" y2="1.725" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.48660625" width="0.127" layer="51"/>
<rectangle x1="-1.5" y1="-1.5" x2="-1.3" y2="-1.3" layer="51"/>
<wire x1="-0.6" y1="-1.7" x2="-0.6" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-0.6" y1="-0.7" x2="0.7" y2="-0.7" width="0.127" layer="51"/>
<wire x1="0.7" y1="-0.7" x2="0.7" y2="0.7" width="0.127" layer="51"/>
<wire x1="0.7" y1="0.7" x2="0" y2="0.7" width="0.127" layer="51"/>
<wire x1="0" y1="0.7" x2="0" y2="1.7" width="0.127" layer="51"/>
<polygon width="0.1524" layer="21">
<vertex x="2.346" y="1.2"/>
<vertex x="2.954" y="0.719"/>
<vertex x="2.954" y="1.681"/>
</polygon>
<rectangle x1="2.1" y1="0.6" x2="2.4" y2="1.8" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="1.8" y2="1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="1.8" x2="1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="-1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-0.4" x2="-1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-1.8" x2="1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="-1.8" x2="1.8" y2="-0.4" width="0.127" layer="21"/>
<text x="-1.862" y="2.027" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.762" y="-2.435" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.5" x2="0.5" y2="0.5" layer="51"/>
</package>
<package name="CREE_XLAMP_XTE">
<smd name="CATHODE" x="-1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="ANODE" x="1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="THERMAL" x="0" y="0" dx="1.3" dy="3.3" layer="1" cream="no"/>
<rectangle x1="-2.05" y1="-0.25" x2="-1.15" y2="0.25" layer="1"/>
<rectangle x1="-2.1" y1="-0.3" x2="-1.15" y2="0.3" layer="29"/>
<rectangle x1="1.15" y1="-0.25" x2="2.05" y2="0.25" layer="1" rot="R180"/>
<rectangle x1="1.15" y1="-0.3" x2="2.1" y2="0.3" layer="29" rot="R180"/>
<rectangle x1="-0.6" y1="-1.6" x2="0.6" y2="1.6" layer="31"/>
<rectangle x1="-2" y1="-0.2" x2="-1.2" y2="0.2" layer="31"/>
<rectangle x1="-1.6" y1="0.2" x2="-1.2" y2="1.6" layer="31"/>
<rectangle x1="-1.6" y1="-1.6" x2="-1.2" y2="-0.2" layer="31"/>
<rectangle x1="1.2" y1="-0.2" x2="2" y2="0.2" layer="31"/>
<rectangle x1="1.2" y1="0.2" x2="1.6" y2="1.6" layer="31"/>
<rectangle x1="1.2" y1="-1.6" x2="1.6" y2="-0.2" layer="31"/>
<wire x1="-1.725" y1="1.725" x2="1.725" y2="1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="1.725" x2="1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="-1.725" x2="-1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="-1.725" y1="-1.725" x2="-1.725" y2="1.725" width="0.127" layer="51"/>
<rectangle x1="-1.5" y1="-1.5" x2="-1.3" y2="-1.3" layer="51"/>
<polygon width="0.1524" layer="21">
<vertex x="2.346" y="1.2"/>
<vertex x="2.954" y="0.719"/>
<vertex x="2.954" y="1.681"/>
</polygon>
<rectangle x1="2.1" y1="0.6" x2="2.4" y2="1.8" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="1.8" y2="1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="1.8" x2="1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="-1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-0.4" x2="-1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-1.8" x2="1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="-1.8" x2="1.8" y2="-0.4" width="0.127" layer="21"/>
<text x="-1.862" y="2.027" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.762" y="-2.435" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.5" x2="0.5" y2="0.5" layer="51"/>
<circle x="0" y="0" radius="1.5811375" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.3928375" width="0.127" layer="51"/>
<wire x1="1.2" y1="0.125" x2="1.45" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.45" y1="0.125" x2="1.45" y2="0.375" width="0.1" layer="51"/>
<wire x1="1.45" y1="0.375" x2="1.7" y2="0.375" width="0.1" layer="51"/>
<wire x1="1.7" y1="0.375" x2="1.7" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.7" y1="0.125" x2="1.95" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.95" y1="0.125" x2="1.95" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.95" y1="-0.125" x2="1.7" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.7" y1="-0.125" x2="1.7" y2="-0.375" width="0.1" layer="51"/>
<wire x1="1.7" y1="-0.375" x2="1.45" y2="-0.375" width="0.1" layer="51"/>
<wire x1="1.45" y1="-0.375" x2="1.45" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.45" y1="-0.125" x2="1.2" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.2" y1="-0.125" x2="1.2" y2="0.125" width="0.1" layer="51"/>
</package>
<package name="EVERLIGHT_45-21">
<wire x1="-1.35" y1="1" x2="1.35" y2="1" width="0.127" layer="51"/>
<wire x1="1.35" y1="1" x2="1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="0.7" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.35" y2="-1" width="0.127" layer="51"/>
<wire x1="1.35" y1="-1" x2="0.9" y2="-1" width="0.127" layer="51"/>
<wire x1="0.9" y1="-1" x2="-1.35" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.35" y1="-1" x2="-1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="-0.7" x2="-1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.35" y2="1" width="0.127" layer="51"/>
<wire x1="1.35" y1="0.7" x2="1.5" y2="0.7" width="0.127" layer="51"/>
<wire x1="1.5" y1="0.7" x2="1.5" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.5" y1="-0.7" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.5" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.5" y1="0.7" x2="-1.5" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-0.7" x2="-1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.15" y1="0.45" x2="-1.15" y2="0.5" width="0.127" layer="51"/>
<wire x1="-1.15" y1="0.5" x2="-0.85" y2="0.8" width="0.127" layer="51" curve="-90"/>
<wire x1="-0.85" y1="0.8" x2="0.8" y2="0.8" width="0.127" layer="51"/>
<wire x1="0.8" y1="0.8" x2="1.15" y2="0.45" width="0.127" layer="51" curve="-90"/>
<wire x1="1.15" y1="0.45" x2="1.15" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.15" y1="-0.5" x2="0.85" y2="-0.8" width="0.127" layer="51" curve="-90"/>
<wire x1="0.85" y1="-0.8" x2="-0.85" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-0.85" y1="-0.8" x2="-1.15" y2="-0.5" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.15" y1="-0.5" x2="-1.15" y2="0.45" width="0.127" layer="51"/>
<smd name="A" x="-1.45" y="0" dx="1.4" dy="1.4" layer="1"/>
<smd name="K" x="1.45" y="0" dx="1.4" dy="1.4" layer="1"/>
<wire x1="0.9" y1="-1" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.1" y2="-0.95" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.95" x2="1.2" y2="-0.95" width="0.127" layer="51"/>
<wire x1="1.2" y1="-0.95" x2="1.3" y2="-0.85" width="0.127" layer="51"/>
<text x="-1.375" y="1.25" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.375" y="-1.633" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-1.45" y1="0.85" x2="-1.45" y2="1.1" width="0.127" layer="21"/>
<wire x1="-1.45" y1="1.1" x2="1.45" y2="1.1" width="0.127" layer="21"/>
<wire x1="1.45" y1="1.1" x2="1.45" y2="0.9" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.9" x2="1.45" y2="0.85" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.85" x2="-1.45" y2="-1.1" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-1.1" x2="1.45" y2="-1.1" width="0.127" layer="21"/>
<wire x1="1.45" y1="-1.1" x2="1.45" y2="-0.85" width="0.127" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0.254" y="0"/>
<vertex x="-0.354" y="0.481"/>
<vertex x="-0.354" y="-0.481"/>
</polygon>
<rectangle x1="0.2" y1="-0.6" x2="0.5" y2="0.6" layer="21" rot="R180"/>
</package>
<package name="PLCC2_REVMOUNT">
<description>&lt;p&gt;PLCC2 - Reverse Mount&lt;/p&gt;
&lt;p&gt;Source: http://catalog.osram-os.com/media/_en/Graphics/00042122_0.pdf&lt;/p&gt;</description>
<smd name="K" x="-2.4" y="0" dx="1.2" dy="2.6" layer="1"/>
<smd name="A" x="2.4" y="0" dx="1.2" dy="2.6" layer="1"/>
<hole x="0" y="0" drill="2.5"/>
<wire x1="-1.7" y1="1.15" x2="-1.7" y2="1.3" width="0.127" layer="51"/>
<wire x1="-1.7" y1="1.3" x2="-1.5" y2="1.5" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.5" y1="1.5" x2="-0.95" y2="1.5" width="0.127" layer="51"/>
<wire x1="-0.95" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="1.5" x2="1.7" y2="1.3" width="0.127" layer="51" curve="-90"/>
<wire x1="1.7" y1="1.3" x2="1.7" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="1.2" x2="1.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="1.7" y1="1.15" x2="2.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="2.7" y1="1.15" x2="2.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="2.7" y1="-1.15" x2="1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.15" x2="1.7" y2="-1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.2" x2="1.7" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.25" x2="1.45" y2="-1.5" width="0.127" layer="51" curve="-90"/>
<wire x1="1.45" y1="-1.5" x2="-1.45" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-1.45" y1="-1.5" x2="-1.7" y2="-1.25" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.7" y1="-1.25" x2="-1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-1.15" x2="-2.65" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-2.65" y1="-1.15" x2="-2.65" y2="1.15" width="0.127" layer="51"/>
<wire x1="-2.65" y1="1.15" x2="-1.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="1.15" x2="-1.7" y2="0.75" width="0.127" layer="51"/>
<wire x1="-1.7" y1="0.75" x2="-1.7" y2="0.65" width="0.127" layer="51"/>
<wire x1="-1.7" y1="0.65" x2="-1.7" y2="-0.65" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-0.65" x2="-1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-0.65" x2="-1.75" y2="-0.65" width="0.127" layer="51"/>
<wire x1="-1.75" y1="-0.65" x2="-1.85" y2="-0.55" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.85" y1="-0.55" x2="-1.85" y2="0.5" width="0.127" layer="51"/>
<wire x1="-1.85" y1="0.5" x2="-1.7" y2="0.65" width="0.127" layer="51" curve="-90"/>
<wire x1="1.7" y1="-1.2" x2="1.7" y2="-0.65" width="0.127" layer="51"/>
<wire x1="1.7" y1="-0.65" x2="1.7" y2="0.65" width="0.127" layer="51"/>
<wire x1="1.7" y1="0.65" x2="1.7" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="0.65" x2="1.75" y2="0.65" width="0.127" layer="51"/>
<wire x1="1.75" y1="0.65" x2="1.85" y2="0.55" width="0.127" layer="51" curve="-90"/>
<wire x1="1.85" y1="0.55" x2="1.85" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.85" y1="-0.5" x2="1.7" y2="-0.65" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.7" y1="0.75" x2="-0.95" y2="1.5" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.220653125" width="0.127" layer="51"/>
<wire x1="0" y1="0.8" x2="0.8" y2="0" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="0.8" y1="0" x2="0" y2="-0.8" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="0" y1="-0.8" x2="-0.8" y2="0" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="-0.8" y1="0" x2="0" y2="0.8" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="-1.75" y1="1.45" x2="-1.6" y2="1.6" width="0.127" layer="21" curve="-90"/>
<wire x1="-1.6" y1="1.6" x2="1.6" y2="1.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="1.6" x2="1.75" y2="1.45" width="0.127" layer="21" curve="-90"/>
<wire x1="-1.75" y1="-1.45" x2="-1.55" y2="-1.6" width="0.127" layer="21" curve="90"/>
<wire x1="-1.55" y1="-1.6" x2="1.55" y2="-1.6" width="0.127" layer="21"/>
<wire x1="1.55" y1="-1.6" x2="1.75" y2="-1.45" width="0.127" layer="21" curve="90"/>
<text x="-1.79" y="1.84" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.74" y="-2.16" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CHIPLED_1206_NOOUTLINE">
<wire x1="-0.6" y1="0.446" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="0.6" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="-0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="-0.154" x2="0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-0.154" x2="0" y2="0.446" width="0.2032" layer="21"/>
<smd name="C" x="0" y="1.496" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="0" y="-1.496" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.27" y="-2.286" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.651" y="-2.286" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="0603-NO">
<wire x1="-1.473" y1="0.729" x2="1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.729" x2="1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.729" x2="-1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.729" x2="-1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.075" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.075" dy="1" layer="1"/>
<text x="1.778" y="-0.127" size="0.8128" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="1.778" y="-0.762" size="0.4064" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="0" y1="0.4" x2="0" y2="-0.4" width="0.3048" layer="21"/>
</package>
<package name="0805-NO">
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.24" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.24" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.3048" layer="21"/>
</package>
<package name="INDUCTOR_1007">
<description>Inductor - 1007 (2518 Metric)
&lt;p&gt;L: 2.5mm x W: 1.8mm x H: 1.8mm&lt;/p&gt;</description>
<wire x1="-1.25" y1="-0.9" x2="-0.75" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-0.75" y1="-0.9" x2="0.75" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="0.75" y1="-0.9" x2="1.25" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-1.25" y1="0.9" x2="-0.75" y2="0.9" width="0.2032" layer="51"/>
<wire x1="-0.75" y1="0.9" x2="0.75" y2="0.9" width="0.2032" layer="51"/>
<wire x1="0.75" y1="0.9" x2="1.25" y2="0.9" width="0.2032" layer="51"/>
<wire x1="-1.25" y1="-0.9" x2="-1.25" y2="0.9" width="0.2032" layer="51"/>
<wire x1="1.25" y1="-0.9" x2="1.25" y2="0.9" width="0.2032" layer="51"/>
<wire x1="-0.75" y1="-0.9" x2="-0.75" y2="0.9" width="0.2032" layer="51"/>
<wire x1="0.75" y1="-0.9" x2="0.75" y2="0.9" width="0.2032" layer="51"/>
<wire x1="-1.8415" y1="1.27" x2="1.8415" y2="1.27" width="0.2032" layer="21"/>
<wire x1="1.8415" y1="1.27" x2="1.8415" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.8415" y1="-1.27" x2="-1.8415" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-1.8415" y1="-1.27" x2="-1.8415" y2="1.27" width="0.2032" layer="21"/>
<smd name="P$1" x="-1.127" y="0" dx="1.016" dy="2.2" layer="1"/>
<smd name="P$2" x="1.127" y="0" dx="1.016" dy="2.2" layer="1"/>
<text x="-1.524" y="1.524" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.651" y="-1.905" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0603">
<description>0603 (1608 Metric)</description>
<wire x1="-1.473" y1="0.729" x2="1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.729" x2="1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.729" x2="-1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.729" x2="-1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<wire x1="-1.65" y1="0.75" x2="1.65" y2="0.75" width="0.2032" layer="21"/>
<wire x1="1.65" y1="0.75" x2="1.65" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="1.65" y1="-0.75" x2="-1.65" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="-1.65" y1="-0.75" x2="-1.65" y2="0.75" width="0.2032" layer="21"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="1.778" y="-0.127" size="0.8128" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="1.778" y="-0.762" size="0.4064" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="0805">
<description>0805 (2012 Metric)</description>
<wire x1="-1.873" y1="0.883" x2="1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="1.873" y1="-0.883" x2="-1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="-1.873" y1="-0.883" x2="-1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.873" y1="0.883" x2="1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="1.85" y1="1" x2="1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1" x2="-1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="-1" x2="-1.85" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="1" x2="1.85" y2="1" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="INDUCTOR_6X6MM_TDK_VLC6045">
<description>&lt;b&gt;Source: &lt;/b&gt;http://www.tdk.co.jp/tefe02/e531_vlc6045.pdf</description>
<wire x1="-3" y1="3" x2="3" y2="3" width="0.2032" layer="51"/>
<wire x1="3" y1="3" x2="3" y2="-3" width="0.2032" layer="51"/>
<wire x1="3" y1="-3" x2="-3" y2="-3" width="0.2032" layer="51"/>
<wire x1="-3" y1="-3" x2="-3" y2="3" width="0.2032" layer="51"/>
<wire x1="-4.5" y1="3.5" x2="4.5" y2="3.5" width="0.2032" layer="21"/>
<wire x1="4.5" y1="3.5" x2="4.5" y2="-3.5" width="0.2032" layer="21"/>
<wire x1="4.5" y1="-3.5" x2="-4.5" y2="-3.5" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="-3.5" x2="-4.5" y2="3.5" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="3.25" width="0.2032" layer="51"/>
<smd name="P$1" x="-2.35" y="0" dx="3.25" dy="6" layer="1"/>
<smd name="P$2" x="2.35" y="0" dx="3.25" dy="6" layer="1"/>
<text x="-4" y="4" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-4" y="-4.5" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_6X6MM_TDK_SLF6045">
<description>&lt;b&gt;Source: &lt;/b&gt; http://www.tdk.co.jp/tefe02/e531_slf6045.pdf</description>
<wire x1="-3" y1="3" x2="3" y2="3" width="0.127" layer="51"/>
<wire x1="3" y1="3" x2="3" y2="-3" width="0.2032" layer="51"/>
<wire x1="3" y1="-3" x2="-3" y2="-3" width="0.127" layer="51"/>
<wire x1="-3" y1="-3" x2="-3" y2="3" width="0.2032" layer="51"/>
<wire x1="-3" y1="2" x2="-3" y2="3" width="0.2032" layer="21"/>
<wire x1="-3" y1="3" x2="3" y2="3" width="0.2032" layer="21"/>
<wire x1="3" y1="3" x2="3" y2="2" width="0.2032" layer="21"/>
<wire x1="-3" y1="-2" x2="-3" y2="-3" width="0.2032" layer="21"/>
<wire x1="-3" y1="-3" x2="3" y2="-3" width="0.2032" layer="21"/>
<wire x1="3" y1="-3" x2="3" y2="-2" width="0.2032" layer="21"/>
<smd name="P$1" x="-2.75" y="0" dx="1.5" dy="2.2" layer="1"/>
<smd name="P$2" x="2.75" y="0" dx="1.5" dy="2.2" layer="1"/>
<text x="-3" y="3.5" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3" y="-3.619" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_5X5MM_TDK_VLC5045">
<description>&lt;b&gt;Source: http://www.tdk.co.jp/tefe02/e531_vlc5045.pdf&lt;/b&gt;</description>
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="-2.85" y1="2.75" x2="2.85" y2="2.75" width="0.2032" layer="21"/>
<wire x1="2.85" y1="2.75" x2="2.85" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="2.85" y1="-2.75" x2="-2.85" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="-2.85" y1="-2.75" x2="-2.85" y2="2.75" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.2032" layer="51"/>
<smd name="P$1" x="-1.6" y="0" dx="2" dy="5" layer="1"/>
<smd name="P$2" x="1.6" y="0" dx="2" dy="5" layer="1"/>
<text x="-3.746" y="3.246" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.746" y="-3.746" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_5X5MM_TDK_VLC5045_NOTHERMALS">
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="-3.738" y1="3" x2="3.738" y2="3" width="0.2032" layer="21"/>
<wire x1="3.738" y1="3" x2="3.738" y2="-3" width="0.2032" layer="21"/>
<wire x1="3.738" y1="-3" x2="-3.738" y2="-3" width="0.2032" layer="21"/>
<wire x1="-3.738" y1="-3" x2="-3.738" y2="3" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.2032" layer="51"/>
<smd name="P$1" x="-2.096" y="0" dx="2.54" dy="5" layer="1" thermals="no"/>
<smd name="P$2" x="2.096" y="0" dx="2.54" dy="5" layer="1" thermals="no"/>
<text x="-3.746" y="3.246" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.746" y="-3.746" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_5X5MM_NR5040_NOTHERMALS">
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="-2.938" y1="2.6" x2="2.938" y2="2.6" width="0.2032" layer="21"/>
<wire x1="2.938" y1="2.6" x2="2.938" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="2.938" y1="-2.6" x2="-2.938" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="-2.938" y1="-2.6" x2="-2.938" y2="2.6" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.2032" layer="51"/>
<smd name="P$1" x="-1.8" y="0" dx="1.8" dy="4" layer="1" thermals="no"/>
<smd name="P$2" x="1.8" y="0" dx="1.8" dy="4" layer="1" thermals="no"/>
<text x="-2.946" y="2.846" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.946" y="-3.238" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_6X6MM_SUMIDA_CDRH5D28">
<description>&lt;p&gt;Source: http://www.sumida.com/products/pdf/CDRH5D28,5D28R,5D28RHP.pdf&lt;/p&gt;</description>
<text x="-3" y="3.35" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3" y="-3.819" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<circle x="0.01" y="0.01" radius="2.787128125" width="0.127" layer="51"/>
<wire x1="-2.85" y1="1.3" x2="-1.35" y2="2.8" width="0.127" layer="51"/>
<wire x1="-1.35" y1="2.8" x2="2.35" y2="2.8" width="0.127" layer="51"/>
<wire x1="2.35" y1="2.8" x2="2.85" y2="2.3" width="0.127" layer="51" curve="-90"/>
<wire x1="2.85" y1="2.3" x2="2.85" y2="-1.3" width="0.127" layer="51"/>
<wire x1="2.85" y1="-1.3" x2="1.35" y2="-2.8" width="0.127" layer="51"/>
<wire x1="1.35" y1="-2.8" x2="-2.45" y2="-2.8" width="0.127" layer="51"/>
<wire x1="-2.45" y1="-2.8" x2="-2.85" y2="-2.4" width="0.127" layer="51" curve="-90"/>
<wire x1="-2.85" y1="-2.4" x2="-2.85" y2="1.3" width="0.127" layer="51"/>
<polygon width="0.127" layer="51">
<vertex x="-2.45" y="1.7"/>
<vertex x="-2.65" y="1.9" curve="-180"/>
<vertex x="-1.95" y="2.6"/>
<vertex x="-1.75" y="2.4"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="2.45" y="-1.75"/>
<vertex x="2.65" y="-1.95" curve="-180"/>
<vertex x="1.95" y="-2.65"/>
<vertex x="1.75" y="-2.45"/>
</polygon>
<smd name="P$1" x="-2.075" y="0" dx="3" dy="6.5" layer="1"/>
<smd name="P$2" x="2.075" y="0" dx="3" dy="6.5" layer="1"/>
<wire x1="-0.4" y1="2.9" x2="0.4" y2="2.9" width="0.127" layer="21"/>
<wire x1="-0.4" y1="-2.9" x2="0.4" y2="-2.9" width="0.127" layer="21"/>
</package>
<package name="INDUCTOR_TAIYOYUDEN_NR3015">
<smd name="P$1" x="-1.1" y="0" dx="0.8" dy="2.7" layer="1"/>
<smd name="P$2" x="1.1" y="0" dx="0.8" dy="2.7" layer="1"/>
<wire x1="-0.97" y1="-1.29" x2="-1.36" y2="-1.29" width="0.127" layer="51"/>
<wire x1="-1.36" y1="-1.29" x2="-1.45" y2="-1.2" width="0.127" layer="51"/>
<wire x1="-1.45" y1="-1.2" x2="-1.45" y2="1.2" width="0.127" layer="51"/>
<wire x1="-1.45" y1="1.2" x2="-1.35" y2="1.3" width="0.127" layer="51"/>
<wire x1="-1.35" y1="1.3" x2="-1.25" y2="1.3" width="0.127" layer="51"/>
<wire x1="-1.25" y1="1.3" x2="-0.95" y2="1.3" width="0.127" layer="51"/>
<wire x1="-0.95" y1="1.3" x2="-0.75" y2="1.5" width="0.127" layer="51"/>
<wire x1="-0.75" y1="1.5" x2="0.8" y2="1.5" width="0.127" layer="51"/>
<wire x1="0.8" y1="1.5" x2="1" y2="1.3" width="0.127" layer="51"/>
<wire x1="1" y1="1.3" x2="1.25" y2="1.3" width="0.127" layer="51"/>
<wire x1="1.25" y1="1.3" x2="1.35" y2="1.3" width="0.127" layer="51"/>
<wire x1="1.35" y1="1.3" x2="1.45" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.45" y1="1.2" x2="1.45" y2="-1.2" width="0.127" layer="51"/>
<wire x1="1.45" y1="-1.2" x2="1.35" y2="-1.3" width="0.127" layer="51"/>
<wire x1="1.35" y1="-1.3" x2="1.25" y2="-1.3" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1.3" x2="1" y2="-1.3" width="0.127" layer="51"/>
<wire x1="1" y1="-1.3" x2="0.8" y2="-1.5" width="0.127" layer="51"/>
<wire x1="0.8" y1="-1.5" x2="-0.75" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-0.75" y1="-1.5" x2="-0.95" y2="-1.3" width="0.127" layer="51"/>
<wire x1="-1.25" y1="1.3" x2="-1.25" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1.3" x2="1.25" y2="1.3" width="0.127" layer="51"/>
<wire x1="-0.95" y1="1.45" x2="-0.8" y2="1.6" width="0.127" layer="21"/>
<wire x1="-0.8" y1="1.6" x2="0.85" y2="1.6" width="0.127" layer="21"/>
<wire x1="0.85" y1="1.6" x2="1" y2="1.45" width="0.127" layer="21"/>
<wire x1="-0.95" y1="-1.45" x2="-0.8" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-0.8" y1="-1.6" x2="0.85" y2="-1.6" width="0.127" layer="21"/>
<wire x1="0.85" y1="-1.6" x2="1" y2="-1.45" width="0.127" layer="21"/>
<text x="-1.524" y="1.774" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.501" y="-2.155" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_COILCRAFT_MA5532-AE">
<smd name="1" x="-4.65" y="0" dx="1.3" dy="3.2" layer="1"/>
<smd name="2" x="4.65" y="0" dx="1.3" dy="3.2" layer="1"/>
<wire x1="-5.85" y1="1.75" x2="5.85" y2="1.75" width="0.127" layer="51"/>
<wire x1="5.85" y1="1.75" x2="5.85" y2="-1.75" width="0.127" layer="51"/>
<wire x1="5.85" y1="-1.75" x2="-5.85" y2="-1.75" width="0.127" layer="51"/>
<wire x1="-5.85" y1="-1.75" x2="-5.85" y2="1.75" width="0.127" layer="51"/>
<wire x1="-5.95" y1="1.85" x2="5.95" y2="1.85" width="0.127" layer="21"/>
<wire x1="5.95" y1="1.85" x2="5.95" y2="-1.85" width="0.127" layer="21"/>
<wire x1="5.95" y1="-1.85" x2="-5.95" y2="-1.85" width="0.127" layer="21"/>
<wire x1="-5.95" y1="-1.85" x2="-5.95" y2="1.85" width="0.127" layer="21"/>
<text x="-5.874" y="2.074" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-5.851" y="-2.405" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_4X4MM_NR401">
<smd name="P$1" x="-1.4" y="0" dx="1.2" dy="3.7" layer="1"/>
<smd name="P$2" x="1.4" y="0" dx="1.2" dy="3.7" layer="1"/>
<wire x1="-2" y1="2" x2="2" y2="2" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="2" y2="-2" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-2" y2="2" width="0.127" layer="21"/>
<text x="-2" y="2.2" size="0.8128" layer="25" ratio="12">&gt;NAME</text>
<text x="-2" y="3.2" size="0.8128" layer="27" ratio="12">&gt;VALUE</text>
</package>
<package name="INDUCTOR_8X8MM">
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="51"/>
<wire x1="-4" y1="4" x2="4" y2="4" width="0.2032" layer="21"/>
<wire x1="4" y1="4" x2="4" y2="-4" width="0.2032" layer="21"/>
<wire x1="4" y1="-4" x2="-4" y2="-4" width="0.2032" layer="21"/>
<wire x1="-4" y1="-4" x2="-4" y2="4" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.2032" layer="51"/>
<smd name="P$1" x="-2.8" y="0" dx="2" dy="7.5" layer="1"/>
<smd name="P$2" x="2.8" y="0" dx="2" dy="7.5" layer="1"/>
<text x="-1.746" y="4.246" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.746" y="-4.746" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_3.6X3MM_VISHAY_IHLP">
<smd name="1" x="-1.4" y="0" dx="1.5" dy="1.2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.5" dy="1.2" layer="1"/>
<wire x1="-1.825" y1="1.5" x2="1.825" y2="1.5" width="0.127" layer="51"/>
<wire x1="1.825" y1="1.5" x2="1.825" y2="-1.5" width="0.127" layer="51"/>
<wire x1="1.825" y1="-1.5" x2="-1.825" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-1.825" y1="-1.5" x2="-1.825" y2="1.5" width="0.127" layer="51"/>
<wire x1="-1.9" y1="0.8" x2="-1.9" y2="1.6" width="0.127" layer="21"/>
<wire x1="-1.9" y1="1.6" x2="1.9" y2="1.6" width="0.127" layer="21"/>
<wire x1="1.9" y1="1.6" x2="1.9" y2="0.8" width="0.127" layer="21"/>
<wire x1="-1.9" y1="-0.8" x2="-1.9" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-1.9" y1="-1.6" x2="1.9" y2="-1.6" width="0.127" layer="21"/>
<wire x1="1.9" y1="-1.6" x2="1.9" y2="-0.8" width="0.127" layer="21"/>
<text x="-1.83" y="1.81" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.83" y="-2.16" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="INDUCTOR_TAIYOYUDEN_NRH2412T">
<smd name="1" x="-0.725" y="0" dx="1" dy="2" layer="1"/>
<smd name="2" x="0.725" y="0" dx="1" dy="2" layer="1"/>
<wire x1="-1.4" y1="1.2" x2="1.4" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.4" y1="1.2" x2="1.4" y2="-1.2" width="0.127" layer="51"/>
<wire x1="1.4" y1="-1.2" x2="-1.4" y2="-1.2" width="0.127" layer="51"/>
<wire x1="-1.4" y1="-1.2" x2="-1.4" y2="1.2" width="0.127" layer="51"/>
<wire x1="-1.5" y1="1.3" x2="1.5" y2="1.3" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.3" x2="1.5" y2="-1.3" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.3" x2="-1.5" y2="-1.3" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.3" x2="-1.5" y2="1.3" width="0.127" layer="21"/>
<text x="-1.224" y="1.478" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.224" y="-1.84" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="CAPACITOR">
<wire x1="0" y1="0.762" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.778" width="0.1524" layer="94"/>
<text x="-2.29" y="1.25" size="1.27" layer="95" font="vector" rot="R90" align="center">&gt;NAME</text>
<text x="2.3" y="1.25" size="1.27" layer="96" font="vector" rot="R90" align="center">&gt;VALUE</text>
<rectangle x1="-1.27" y1="0.508" x2="1.27" y2="1.016" layer="94"/>
<rectangle x1="-1.27" y1="1.524" x2="1.27" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="CAPACITOR_POL">
<wire x1="-1.27" y1="2.54" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="1.778" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.778" x2="-1.27" y2="1.778" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.778" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="-0.635" y1="3.81" x2="-0.635" y2="3.048" width="0.254" layer="94"/>
<wire x1="-1.016" y1="3.429" x2="-0.254" y2="3.429" width="0.254" layer="94"/>
<text x="-2.39" y="1.25" size="1.27" layer="95" font="vector" rot="R90" align="center">&gt;NAME</text>
<text x="2.5" y="1.25" size="1.27" layer="96" font="vector" rot="R90" align="center">&gt;VALUE</text>
<rectangle x1="-1.397" y1="0" x2="1.397" y2="0.889" layer="94"/>
<pin name="+" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="-" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.524" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VBUS">
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="VBUS" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="VBAT">
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="VBAT" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="ATMEGA32U4">
<wire x1="-17.78" y1="45.72" x2="20.32" y2="45.72" width="0.254" layer="94"/>
<wire x1="20.32" y1="45.72" x2="20.32" y2="-33.02" width="0.254" layer="94"/>
<wire x1="20.32" y1="-33.02" x2="-17.78" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-33.02" x2="-17.78" y2="45.72" width="0.254" layer="94"/>
<text x="-17.78" y="-38.1" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="45.72" size="1.778" layer="96">&gt;VALUE</text>
<pin name="XTAL2" x="-22.86" y="-10.16" length="middle"/>
<pin name="XTAL1" x="-22.86" y="-2.54" length="middle"/>
<pin name="GND" x="-22.86" y="-22.86" length="middle"/>
<pin name="VCC" x="-22.86" y="30.48" length="middle"/>
<pin name="UVCC" x="-22.86" y="25.4" length="middle"/>
<pin name="UGND" x="-22.86" y="-17.78" length="middle"/>
<pin name="D-" x="-22.86" y="15.24" length="middle"/>
<pin name="AVCC" x="-22.86" y="22.86" length="middle"/>
<pin name="PB3(PDO/MISO)" x="25.4" y="0" length="middle" rot="R180"/>
<pin name="PB2(PDI/MOSI)" x="25.4" y="-2.54" length="middle" rot="R180"/>
<pin name="PB1(SCK)" x="25.4" y="-5.08" length="middle" rot="R180"/>
<pin name="PB0(SS)" x="25.4" y="-7.62" length="middle" rot="R180"/>
<pin name="PD7(OC4D/ADC10/T0)" x="25.4" y="-12.7" length="middle" rot="R180"/>
<pin name="PD6(T1/ADC9/!OC4D)" x="25.4" y="-15.24" length="middle" rot="R180"/>
<pin name="PD5(XCK/CTS)" x="25.4" y="-17.78" length="middle" rot="R180"/>
<pin name="PD4(ICP1/ADC8)" x="25.4" y="-20.32" length="middle" rot="R180"/>
<pin name="PD3(INT3/TXD1)" x="25.4" y="-22.86" length="middle" rot="R180"/>
<pin name="PD2(INT2/RXD1)" x="25.4" y="-25.4" length="middle" rot="R180"/>
<pin name="PD1(INT1/SDA)" x="25.4" y="-27.94" length="middle" rot="R180"/>
<pin name="PD0(INT0/OC0B/SCL)" x="25.4" y="-30.48" length="middle" rot="R180"/>
<pin name="PC7(ICP3/CLK0/OC4A)" x="25.4" y="15.24" length="middle" rot="R180"/>
<pin name="PC6(OC3A/!OC4A)" x="25.4" y="17.78" length="middle" rot="R180"/>
<pin name="PB4(ADC11)" x="25.4" y="2.54" length="middle" rot="R180"/>
<pin name="PB6(OC1B/OC4B/ADC13)" x="25.4" y="7.62" length="middle" rot="R180"/>
<pin name="PB5(OC1A/ADC12/!OC4B)" x="25.4" y="5.08" length="middle" rot="R180"/>
<pin name="PB7(OC0A/OC1C/RTS)" x="25.4" y="10.16" length="middle" rot="R180"/>
<pin name="/RESET" x="-22.86" y="43.18" length="middle" function="dot"/>
<pin name="D+" x="-22.86" y="12.7" length="middle"/>
<pin name="UCAP" x="-22.86" y="7.62" length="middle"/>
<pin name="PE2(!HWB)" x="25.4" y="25.4" length="middle" rot="R180"/>
<pin name="PF0(ADC0)" x="25.4" y="43.18" length="middle" rot="R180"/>
<pin name="PF1(ADC1)" x="25.4" y="40.64" length="middle" rot="R180"/>
<pin name="PF4(ADC4/TCK)" x="25.4" y="38.1" length="middle" rot="R180"/>
<pin name="PF5(ADC5/TMS)" x="25.4" y="35.56" length="middle" rot="R180"/>
<pin name="PF6(ADC6/TDO)" x="25.4" y="33.02" length="middle" rot="R180"/>
<pin name="PF7(ADC7(TDI)" x="25.4" y="30.48" length="middle" rot="R180"/>
<pin name="PE6(INT.6/AIN0)" x="25.4" y="22.86" length="middle" rot="R180"/>
<pin name="VBUS" x="-22.86" y="38.1" length="middle"/>
<pin name="GND1" x="-22.86" y="-25.4" length="middle"/>
<pin name="AVCC1" x="-22.86" y="20.32" length="middle"/>
<pin name="VCC1" x="-22.86" y="27.94" length="middle"/>
<pin name="AREF" x="-22.86" y="2.54" length="middle"/>
<pin name="GND2" x="-22.86" y="-27.94" length="middle"/>
<pin name="GND3" x="-22.86" y="-30.48" length="middle"/>
</symbol>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.27" layer="95" font="vector" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.016" layer="96" font="vector" ratio="15" align="center">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="VREG_SOT23-5">
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<text x="-7.62" y="6.096" size="1.27" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.27" layer="95">&gt;VALUE</text>
<pin name="IN" x="-10.16" y="2.54" length="short" direction="pwr"/>
<pin name="OUT" x="10.16" y="2.54" length="short" direction="sup" rot="R180"/>
<pin name="EN" x="-10.16" y="0" length="short" direction="in"/>
<pin name="GND" x="-10.16" y="-2.54" length="short" direction="pwr"/>
<pin name="P4" x="10.16" y="-2.54" length="short" rot="R180"/>
</symbol>
<symbol name="LED">
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="2.54" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="2.8575" x2="-0.3175" y2="2.2225" width="0.254" layer="94"/>
<wire x1="-0.3175" y1="2.2225" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="3.175" x2="-0.9525" y2="2.8575" width="0.254" layer="94"/>
<wire x1="0.3175" y1="2.8575" x2="0.9525" y2="2.2225" width="0.254" layer="94"/>
<wire x1="1.27" y1="3.175" x2="0.3175" y2="2.8575" width="0.254" layer="94"/>
<wire x1="0.9525" y1="2.2225" x2="1.27" y2="3.175" width="0.254" layer="94"/>
<text x="-1.27" y="4.445" size="1.27" layer="95" align="center">&gt;NAME</text>
<text x="-1.27" y="-2.794" size="1.27" layer="96" align="center">&gt;VALUE</text>
<pin name="A" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="3.3V">
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="3.3V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="INDUCTOR">
<text x="0" y="2.54" size="1.27" layer="95" align="center">&gt;NAME</text>
<text x="0" y="-1.54" size="1.27" layer="96" align="center">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<wire x1="-2.54" y1="0.3175" x2="-1.27" y2="0.3175" width="0.254" layer="94" curve="-180"/>
<wire x1="-1.27" y1="0.3175" x2="0" y2="0.3175" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="0.3175" x2="1.27" y2="0.3175" width="0.254" layer="94" curve="-180"/>
<wire x1="1.27" y1="0.3175" x2="2.54" y2="0.3175" width="0.254" layer="94" curve="-180"/>
<wire x1="-2.54" y1="0.3175" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.3175" x2="2.54" y2="0" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CAP_CERAMIC" prefix="C" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Ceramic Capacitors&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;For new designs, use the packages preceded by an '_' character since they are more reliable:&lt;/p&gt;
&lt;p&gt;The following footprints should be used on most boards:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;For extremely tight-pitch boards where space is at a premium, the following 'micro-pitch' footprints can be used (smaller pads, no silkscreen outline, etc.):&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="-2.54"/>
</gates>
<devices>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NOOUTLINE" package="0805-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_10MGAP" package="0805_10MGAP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603_NO" package="0603-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206" package="_1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206MP" package="_1206MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP_ELECTROLYTIC" prefix="C" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Electrolytic Capacitors&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;&lt;b&gt;SMT&lt;/b&gt;&lt;hr/&gt;&lt;/p&gt;
&lt;b&gt;PANASONIC_C&lt;/b&gt; - Size C Panasonic Electrolytic Aluminum Capacitor
&lt;ul&gt;
&lt;li&gt;47µF 16V 20% Electrolytic Capacitor [Digikey: PCE3890TR-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;PANASONIC_D&lt;/b&gt; - Size D Panasonic Electrolytic Aluminum Capacitor
&lt;ul&gt;
&lt;li&gt;100µF 25V 20% Electrolytic Capacitor [Digikey: PCE3898TR-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;b&gt;PTH&lt;/b&gt;&lt;hr/&gt;&lt;/p&gt;
&lt;b&gt;3.5 mm grid, 8 mm diameter&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;...&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;3.5 mm grid, 10 mm diameter&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;...&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CAPACITOR_POL" x="0" y="-2.54"/>
</gates>
<devices>
<device name="PANASONIC_C" package="PANASONIC_C">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PANASONIC_D" package="PANASONIC_D">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH_3.5MMGRID_8MMDIA" package="CELEC_3.5MM_8MM">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH_3.5MMGRID_10MMDIA" package="CELEC_3.5MM_10MM">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND">
<description>&lt;b&gt;GND&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VBUS">
<description>&lt;p&gt;VBUS Supply Symbole&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="VBUS" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VBAT">
<description>VBAT Supply Sumbol</description>
<gates>
<gate name="G$1" symbol="VBAT" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ATMEGA32U4" prefix="IC">
<description>&lt;p&gt;http://www.ladyada.net/library/eagle&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="ATMEGA32U4" x="0" y="-5.08"/>
</gates>
<devices>
<device name="-AU" package="TQFP44">
<connects>
<connect gate="G$1" pin="/RESET" pad="13"/>
<connect gate="G$1" pin="AREF" pad="42"/>
<connect gate="G$1" pin="AVCC" pad="24"/>
<connect gate="G$1" pin="AVCC1" pad="44"/>
<connect gate="G$1" pin="D+" pad="4"/>
<connect gate="G$1" pin="D-" pad="3"/>
<connect gate="G$1" pin="GND" pad="15"/>
<connect gate="G$1" pin="GND1" pad="23"/>
<connect gate="G$1" pin="GND2" pad="35"/>
<connect gate="G$1" pin="GND3" pad="43"/>
<connect gate="G$1" pin="PB0(SS)" pad="8"/>
<connect gate="G$1" pin="PB1(SCK)" pad="9"/>
<connect gate="G$1" pin="PB2(PDI/MOSI)" pad="10"/>
<connect gate="G$1" pin="PB3(PDO/MISO)" pad="11"/>
<connect gate="G$1" pin="PB4(ADC11)" pad="28"/>
<connect gate="G$1" pin="PB5(OC1A/ADC12/!OC4B)" pad="29"/>
<connect gate="G$1" pin="PB6(OC1B/OC4B/ADC13)" pad="30"/>
<connect gate="G$1" pin="PB7(OC0A/OC1C/RTS)" pad="12"/>
<connect gate="G$1" pin="PC6(OC3A/!OC4A)" pad="31"/>
<connect gate="G$1" pin="PC7(ICP3/CLK0/OC4A)" pad="32"/>
<connect gate="G$1" pin="PD0(INT0/OC0B/SCL)" pad="18"/>
<connect gate="G$1" pin="PD1(INT1/SDA)" pad="19"/>
<connect gate="G$1" pin="PD2(INT2/RXD1)" pad="20"/>
<connect gate="G$1" pin="PD3(INT3/TXD1)" pad="21"/>
<connect gate="G$1" pin="PD4(ICP1/ADC8)" pad="25"/>
<connect gate="G$1" pin="PD5(XCK/CTS)" pad="22"/>
<connect gate="G$1" pin="PD6(T1/ADC9/!OC4D)" pad="26"/>
<connect gate="G$1" pin="PD7(OC4D/ADC10/T0)" pad="27"/>
<connect gate="G$1" pin="PE2(!HWB)" pad="33"/>
<connect gate="G$1" pin="PE6(INT.6/AIN0)" pad="1"/>
<connect gate="G$1" pin="PF0(ADC0)" pad="41"/>
<connect gate="G$1" pin="PF1(ADC1)" pad="40"/>
<connect gate="G$1" pin="PF4(ADC4/TCK)" pad="39"/>
<connect gate="G$1" pin="PF5(ADC5/TMS)" pad="38"/>
<connect gate="G$1" pin="PF6(ADC6/TDO)" pad="37"/>
<connect gate="G$1" pin="PF7(ADC7(TDI)" pad="36"/>
<connect gate="G$1" pin="UCAP" pad="6"/>
<connect gate="G$1" pin="UGND" pad="5"/>
<connect gate="G$1" pin="UVCC" pad="2"/>
<connect gate="G$1" pin="VBUS" pad="7"/>
<connect gate="G$1" pin="VCC" pad="14"/>
<connect gate="G$1" pin="VCC1" pad="34"/>
<connect gate="G$1" pin="XTAL1" pad="17"/>
<connect gate="G$1" pin="XTAL2" pad="16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-MU" package="TQFN44_7MM">
<connects>
<connect gate="G$1" pin="/RESET" pad="13"/>
<connect gate="G$1" pin="AREF" pad="42"/>
<connect gate="G$1" pin="AVCC" pad="24"/>
<connect gate="G$1" pin="AVCC1" pad="44"/>
<connect gate="G$1" pin="D+" pad="4"/>
<connect gate="G$1" pin="D-" pad="3"/>
<connect gate="G$1" pin="GND" pad="15 THERMAL"/>
<connect gate="G$1" pin="GND1" pad="23"/>
<connect gate="G$1" pin="GND2" pad="35"/>
<connect gate="G$1" pin="GND3" pad="43"/>
<connect gate="G$1" pin="PB0(SS)" pad="8"/>
<connect gate="G$1" pin="PB1(SCK)" pad="9"/>
<connect gate="G$1" pin="PB2(PDI/MOSI)" pad="10"/>
<connect gate="G$1" pin="PB3(PDO/MISO)" pad="11"/>
<connect gate="G$1" pin="PB4(ADC11)" pad="28"/>
<connect gate="G$1" pin="PB5(OC1A/ADC12/!OC4B)" pad="29"/>
<connect gate="G$1" pin="PB6(OC1B/OC4B/ADC13)" pad="30"/>
<connect gate="G$1" pin="PB7(OC0A/OC1C/RTS)" pad="12"/>
<connect gate="G$1" pin="PC6(OC3A/!OC4A)" pad="31"/>
<connect gate="G$1" pin="PC7(ICP3/CLK0/OC4A)" pad="32"/>
<connect gate="G$1" pin="PD0(INT0/OC0B/SCL)" pad="18"/>
<connect gate="G$1" pin="PD1(INT1/SDA)" pad="19"/>
<connect gate="G$1" pin="PD2(INT2/RXD1)" pad="20"/>
<connect gate="G$1" pin="PD3(INT3/TXD1)" pad="21"/>
<connect gate="G$1" pin="PD4(ICP1/ADC8)" pad="25"/>
<connect gate="G$1" pin="PD5(XCK/CTS)" pad="22"/>
<connect gate="G$1" pin="PD6(T1/ADC9/!OC4D)" pad="26"/>
<connect gate="G$1" pin="PD7(OC4D/ADC10/T0)" pad="27"/>
<connect gate="G$1" pin="PE2(!HWB)" pad="33"/>
<connect gate="G$1" pin="PE6(INT.6/AIN0)" pad="1"/>
<connect gate="G$1" pin="PF0(ADC0)" pad="41"/>
<connect gate="G$1" pin="PF1(ADC1)" pad="40"/>
<connect gate="G$1" pin="PF4(ADC4/TCK)" pad="39"/>
<connect gate="G$1" pin="PF5(ADC5/TMS)" pad="38"/>
<connect gate="G$1" pin="PF6(ADC6/TDO)" pad="37"/>
<connect gate="G$1" pin="PF7(ADC7(TDI)" pad="36"/>
<connect gate="G$1" pin="UCAP" pad="6"/>
<connect gate="G$1" pin="UGND" pad="5"/>
<connect gate="G$1" pin="UVCC" pad="2"/>
<connect gate="G$1" pin="VBUS" pad="7"/>
<connect gate="G$1" pin="VCC" pad="14"/>
<connect gate="G$1" pin="VCC1" pad="34"/>
<connect gate="G$1" pin="XTAL1" pad="17"/>
<connect gate="G$1" pin="XTAL2" pad="16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Resistors&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;For new designs, use the packages preceded by an '_' character since they are more reliable:&lt;/p&gt;
&lt;p&gt;The following footprints should be used on most boards:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;For extremely tight-pitch boards where space is at a premium, the following 'micro-pitch' footprints can be used (smaller pads, no silkscreen outline, etc.):&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2512" package="2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOOUTLINE" package="0805-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603_NOOUT" package="0603-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206" package="_1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206MP" package="_1206MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_10MGAP" package="0805_10MGAP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG_SOT23-5" prefix="U" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;SOT23-5 Fixed Voltage Regulators&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;&lt;/p&gt;
&lt;table width="700"&gt;
&lt;tr bgcolor="#EEEEEE" &gt;
&lt;td&gt;&lt;b&gt;Part&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;Current Out&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V Out&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V In&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V Dropout&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;θJA (°C/W)&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;TJ (°C)&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;Digikey Part No.&lt;/b&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP121&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.4-5.5V&lt;/td&gt;
  &lt;td&gt;0.09V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP121-AUJZ33R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP121&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.0V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.1-5.5V&lt;/td&gt;
  &lt;td&gt;0.09V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP121-AUJZ30R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP122&lt;/td&gt;
  &lt;td&gt;&lt;strong&gt;300mA&lt;/strong&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.4-5.5V&lt;/td&gt;
  &lt;td&gt;0.085V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP122AUJZ-3.3-R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP1712&lt;/td&gt;
  &lt;td&gt;&lt;strong&gt;300mA&lt;/strong&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-5.5V&lt;/td&gt;
  &lt;td&gt;0.17V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP1712AUJZ-3.3-R7TR-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;AP7311 (&lt;b&gt;Low Cost&lt;/b&gt;)&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-6V&lt;/td&gt;
  &lt;td&gt;0.15V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;AP7311-33WG-7DICT-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;LD39015M18R&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;1.8V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;1.9V-5.5V&lt;/td&gt;
  &lt;td&gt;0.08V @ 100mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;497-6977-1-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;LP2985A-33DBVR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.3-16V&lt;/td&gt;
  &lt;td&gt;0.28V @ 150mA&lt;/td&gt;
  &lt;td&gt;206&lt;/td&gt;
  &lt;td&gt;150&lt;/td&gt;
  &lt;td&gt;296-18479-1-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;MCP1824T-3302E/OT&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;300mA&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5V-6V&lt;/td&gt;
  &lt;td&gt;0.2V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;MCP1824T-3302E/OTCT-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;MIC5205-2.5YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;2.5V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;2.7-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1257-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;MIC5205-3.0YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.0V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.2V-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1258-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;MIC5205-3.3YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5V-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1259-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;TPS780330220&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V+2.2V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.6-5.5V&lt;/td&gt;
  &lt;td&gt;250mV Max&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;296-23332-1-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;TDA3663/N1,135&lt;/td&gt;
  &lt;td&gt;100mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-&lt;b&gt;45V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;0.18V @ 50mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;568-5343-1-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
&lt;/tr&gt;

&lt;/table&gt;
&lt;p&gt;Max operating temp can be calculated using θJA, TJ (max junction temperature), and power in watts.  Set the "Maximum Ambient Temperature" until it reaches TJ ("Max Junction Temperature"), which is the absolute limit for safe use of the regulator: &lt;a href="http://www.daycounter.com/Calculators/Heat-Sink-Temperature-Calculator.phtml"&gt;Heat Sink Temperature Calculator&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;For example, With 12V source into a 3.3V LP2985 and a 30mA load, we are dissipating (12V-3.3V) * 0.03A = 0.261W.  With a θJA of 206 °C/W, a TJ of 150°C, and 261mW we can safely use the chip without a heat sink up to 75°C (=147.1°C Junction Temperature).&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="VREG_SOT23-5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5">
<connects>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="5"/>
<connect gate="G$1" pin="P4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="D" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;LED&lt;/b&gt;&lt;/p&gt;
&lt;b&gt;0603&lt;/b&gt; - 0603 Surface Mount Package
&lt;hr&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;2mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Green LED - Low Power (3.9mcd, 2ma, 1.7Vf) - Digikey: 475-2709-2-ND&lt;/li&gt;
&lt;li&gt;Orange LED - Low Power (9.8mcd, 2ma, 1.8Vf) - Digikey: 475-1194-2-ND&lt;/li&gt;
&lt;li&gt;Red LED - Low Power (5mcd, 2ma, 1.8Vf) - Digikey: 475-1195-2-ND&lt;/li&gt;
&lt;li&gt;Yellow LED - Low Power (7mcd, 2ma, 1.8Vf) - Digikey: 475-1196-2-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;5mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Blue LED - Low Power (17mcd, 5ma, 2.9Vf) - Digikey: LNJ937W8CRACT-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0805&lt;/b&gt; - 0805 Surface Mount Package
&lt;hr&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;2mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Red LED (8.8mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2510-1-ND]&lt;/li&gt;
&lt;li&gt;Green LED (5mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2730-1-ND]&lt;/li&gt;
&lt;li&gt;Yellow LED (11.3mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2555-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;20mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Red LED (104mcd, 20mA, Diffused) - LS R976 [Digikey: 475-1278-6-ND]&lt;/li&gt;
&lt;li&gt;Red LED (12mcd, 20mA, 2.0Vf, Clear) - APT2012EC [Digikey: 754-1128-1-ND]&lt;/li&gt;
&lt;li&gt;Green LED (15mcd, 20mA, 2.2Vf, Clear) - APT2012GC [Digikey: 754-1131-1-ND]&lt;/li&gt;
&lt;li&gt;Orange LED (160mcd, 20mA, 2.1Vf, Clear) - APT2012SECK [Digikey: 754-1130-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;li&gt;&lt;b&gt;1206&lt;/b&gt; - 1206 Surface Mount Package
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;Green LED (26mcd, 20mA, Diffused) - LG N971  [Digikey: 475-1407-6-ND]&lt;/li&gt;
&lt;li&gt;Red LED (15mcd, 20mA, Diffused) - LH N974 [Digikey: 475-1416-6-ND]&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;Cree&lt;/b&gt; - Cree High-Power Surface Mount LEDs
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;XPEBWT-L1-0000-00D50 - White 111lm 350mA 2.9Vf 6200K 110°&lt;/li&gt;
&lt;li&gt;XTEAWT-00-0000-00000LEE3 - White 114lm 350mA 2.85Vf 5000K 115°&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;Everlight&lt;/b&gt; - Everlight 45-21 Series Surface Mount LEDs
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;45-21/QK2C-B2832AC2CB2/2T - Warm White 2000mcd 20mA 3.25Vf 3050K 120°&lt;/li&gt;
&lt;li&gt;45-21/LK2C-B38452C4CB2/2T - Nuetral White 2000mcd 20mA 3.25Vf 4150K 120°&lt;/li&gt;
&lt;li&gt;45-21/LK2C-B50634C6CB2/2T - Cold White 2200mcd 20mA 3.25Vf 5650K 120°&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;PLCC2 Reverse Mount&lt;/b&gt;
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;LS T77K-J1L2-1-0-2-R18-Z - Red 11.25mcd 2mA 1.8Vf 630nm 120°&lt;/li&gt;
&lt;li&gt;LO T77K-L1M2-24-Z - Orange 19.6mcd 2mA 1.8Vf 606nm 120°&lt;/li&gt;
&lt;li&gt;LY T77K-K2M1-26-Z - Yellow 15.7mcd 2mA 1.8Vf 587nm 120°&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="CHIPLED_1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="CHIPLED_0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="CHIPLED_0603">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603_NOOUTLINE" package="CHIPLED_0603_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOOUTLINE" package="CHIPLED_0805_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="XPE2" package="CREE_XLAMP_XPE2">
<connects>
<connect gate="G$1" pin="A" pad="ANODE"/>
<connect gate="G$1" pin="C" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="XTE" package="CREE_XLAMP_XTE">
<connects>
<connect gate="G$1" pin="A" pad="ANODE"/>
<connect gate="G$1" pin="C" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EV45-21" package="EVERLIGHT_45-21">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PLCC2_REV" package="PLCC2_REVMOUNT">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206_NOOUTLINE" package="CHIPLED_1206_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3.3V">
<description>&lt;b&gt;3.3V Supply&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="INDUCTOR" prefix="L" uservalue="yes">
<description>&lt;b&gt;Inductors&lt;/b&gt;
&lt;p&gt;0603:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;10nH Ceramic Inductor - microwire antenna/RF (Digikey: 712-1434-2-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;0805:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;560nH Ceramic Inductor - RF (Digikey: 553-1047-1-ND)&lt;/li&gt;
&lt;li&gt;270nH Ceramic Inductor - Q = 40@250MHz, +-5%, 1 Ohm DC Resistance (Digikey: 535-10506-2-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;1007 (2518 Metric) SMT:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;10µH 10% 250mOhm 820mA 1007 Inductor (Digikey: 587-2189-1-ND)&lt;/li&gt;
&lt;li&gt;22µH 10% 500mOhm 580mA 1007 Inductor (Digikey: 587-2190-1-ND)&lt;/li&gt;
&lt;li&gt;47µH 10% 950mOhm 420mA 1007 Inductor (Digikey: 587-2191-1-ND)&lt;/li&gt;
&lt;li&gt;47µH 5% 100mOhm 1A 1008 Inductor (Digikey: 732-1816-1-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;5.0x5.0mm (Taiyo Yuden NR5040 Series)&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;6.8µH 20% 2.3A 64mOhm Inductor (Digikey: 587-2374-2-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;5.0x5.0mm (TDK VLC5045 Series)&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;4.7µH 20% 3.3A 34mOhm Inductor (Digikey: 445-6526-1-ND)&lt;/li&gt;
&lt;li&gt;6.8µH 20% 2.7A 46mOhm Inductor (Digikey: 445-6527-1-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;6.0x6.0mm (TDK VLC6045 Series)&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;4.7µH 20% 3.8A 27mOhm Inductor (Digikey: 445-6538-2-ND)&lt;/li&gt;
&lt;li&gt;6.8µH 20% 3A 41mOhm Inductor (Digikey: 445-6540-1-ND)&lt;/li&gt;
&lt;li&gt;6.2µH 30% 2.2A 45mOhm Inductor (Digikey: SRR5028-6R2YCT-ND) - Not TDK VLC6045 but footprint should match&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;6.0x6.0mm (TDK SLF6045 Series)&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;6.8uH 30% 2A 33mOhm Inductor (Digikey: 445-4572-1-ND, Mouser: 810-SLF645T6R8N2R0PF)&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;6.0x6.0mm (Sumida CDRH5D28 Series)&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;6.2uH 30% 1.8A 45mOhm Inductor (Digikey: 308-1542-1-ND)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;Taiyo Yuden NR3015T2R2M - 2.2uH 20% 1.5A (Digikey: 587-1648-2-ND, Mouser: 963-NR3015T2R2M) - Used with TI TPS62172&lt;/p&gt;
&lt;p&gt;CoilCraft RFID Transponder Coil - MA5532-AE (For use with AS3935 Lightning Sensor)&lt;/p&gt;

&lt;p&gt;Taiyo Yuden NRH2412T2R2MNGH - 2.2uH 20% 1AA (Digikey: 587-3443-1-ND) - Used with TI LM3671&lt;/p&gt;

&lt;p&gt;
Vishay IHLP
&lt;ul&gt;
&lt;li&gt;1.0uH Molded Inductor - 24mOhm DCR, 5A, +/-20%, -55°C-125°C (Digikey: 541-1319-1-ND)&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="INDUCTOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="INDUCTOR_1007">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TDK_VLC6045" package="INDUCTOR_6X6MM_TDK_VLC6045">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TDK_SLF6045" package="INDUCTOR_6X6MM_TDK_SLF6045">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TDK_VLC5045" package="INDUCTOR_5X5MM_TDK_VLC5045">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TDK_VLC5045_NOTHERM" package="INDUCTOR_5X5MM_TDK_VLC5045_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NR5040" package="INDUCTOR_5X5MM_NR5040_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CDRH5D28" package="INDUCTOR_6X6MM_SUMIDA_CDRH5D28">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NR3015" package="INDUCTOR_TAIYOYUDEN_NR3015">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MA5532" package="INDUCTOR_COILCRAFT_MA5532-AE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NR401" package="INDUCTOR_4X4MM_NR401">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-8X8" package="INDUCTOR_8X8MM">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VISHAY_IHLP" package="INDUCTOR_3.6X3MM_VISHAY_IHLP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NRH2412T" package="INDUCTOR_TAIYOYUDEN_NRH2412T">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603_NO" package="0603-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NO" package="0805-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-Clocks">
<description>&lt;h3&gt;SparkFun Clocks, Oscillators and Resonators&lt;/h3&gt;
This library contains the real-time clocks, oscillators, resonators, and crystals we use. 
&lt;br&gt;
&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is &lt;b&gt; the end user's responsibility&lt;/b&gt; to ensure correctness and suitablity for a given componet or application. 
&lt;br&gt;
&lt;br&gt;If you enjoy using this library, please buy one of our products at &lt;a href=" www.sparkfun.com"&gt;SparkFun.com&lt;/a&gt;.
&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;
&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="CRYSTAL-SMD-5X3.2-4PAD">
<description>&lt;h3&gt;5x3.2mm SMD Crystal&lt;/h3&gt;
&lt;p&gt;Example: &lt;a href="https://www.sparkfun.com/products/94"&gt;16MHz SMD Crystal&lt;/a&gt; (&lt;a href="https://www.sparkfun.com/datasheets/Components/SPK-5032-16MHZ.pdf"&gt;Datasheet&lt;/a&gt;)&lt;/p&gt;</description>
<wire x1="-0.6" y1="1.7" x2="0.6" y2="1.7" width="0.2032" layer="21"/>
<wire x1="2.6" y1="0.3" x2="2.6" y2="-0.3" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-1.7" x2="-0.6" y2="-1.7" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="0.3" x2="-2.6" y2="-0.3" width="0.2032" layer="21"/>
<smd name="1" x="-1.85" y="-1.15" dx="1.9" dy="1.1" layer="1"/>
<smd name="3" x="1.85" y="1.15" dx="1.9" dy="1.1" layer="1"/>
<smd name="4" x="-1.85" y="1.15" dx="1.9" dy="1.1" layer="1"/>
<smd name="2" x="1.85" y="-1.15" dx="1.9" dy="1.1" layer="1"/>
<text x="0" y="1.905" size="0.6096" layer="25" font="vector" ratio="20" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.905" size="0.6096" layer="27" font="vector" ratio="20" align="top-center">&gt;VALUE</text>
<wire x1="-2.5" y1="1.6" x2="-2.5" y2="-1.6" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-1.6" x2="2.5" y2="-1.6" width="0.127" layer="51"/>
<wire x1="2.5" y1="-1.6" x2="2.5" y2="1.6" width="0.127" layer="51"/>
<wire x1="2.5" y1="1.6" x2="-2.5" y2="1.6" width="0.127" layer="51"/>
<polygon width="0.127" layer="51">
<vertex x="-2.5" y="1.6"/>
<vertex x="-2.5" y="0.8"/>
<vertex x="-1.3" y="0.8"/>
<vertex x="-1.3" y="1.6"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="2.5" y="-1.6"/>
<vertex x="2.5" y="-0.8"/>
<vertex x="1.3" y="-0.8"/>
<vertex x="1.3" y="-1.6"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="1.3" y="1.6"/>
<vertex x="1.3" y="0.8"/>
<vertex x="2.5" y="0.8"/>
<vertex x="2.5" y="1.6"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="-1.3" y="-1.6"/>
<vertex x="-1.3" y="-0.8"/>
<vertex x="-2.5" y="-0.8"/>
<vertex x="-2.5" y="-1.6"/>
</polygon>
</package>
<package name="CRYSTAL-SMD-3.2X2.5MM">
<description>&lt;h3&gt;3.2 x 2.5mm SMD Crystal Package&lt;/h3&gt;
&lt;p&gt;Example: &lt;a href="http://www.digikey.com/product-search/en?keywords=SER3627TR-ND"&gt;SX-32S&lt;/a&gt;&lt;/p&gt;</description>
<wire x1="-1.6" y1="-1.25" x2="-1.6" y2="1.25" width="0.127" layer="51"/>
<wire x1="-1.6" y1="1.25" x2="1.6" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.6" y1="1.25" x2="1.6" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.6" y1="-1.25" x2="-1.6" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-0.4" y1="1.377" x2="0.4" y2="1.377" width="0.2032" layer="21"/>
<wire x1="-1.727" y1="-0.15" x2="-1.727" y2="0.15" width="0.2032" layer="21"/>
<wire x1="1.727" y1="0.15" x2="1.727" y2="-0.15" width="0.2032" layer="21"/>
<wire x1="0.4" y1="-1.377" x2="-0.4" y2="-1.377" width="0.2032" layer="21"/>
<rectangle x1="-1.6" y1="0.35" x2="-0.6" y2="1.15" layer="51"/>
<rectangle x1="0.6" y1="-1.15" x2="1.6" y2="-0.35" layer="51" rot="R180"/>
<rectangle x1="-1.6" y1="-1.15" x2="-0.6" y2="-0.35" layer="51"/>
<rectangle x1="0.6" y1="0.35" x2="1.6" y2="1.15" layer="51" rot="R180"/>
<smd name="1" x="-1.175" y="-0.875" dx="1.2" dy="1.1" layer="1" rot="R180"/>
<smd name="2" x="1.175" y="-0.875" dx="1.2" dy="1.1" layer="1"/>
<smd name="3" x="1.175" y="0.875" dx="1.2" dy="1.1" layer="1"/>
<smd name="4" x="-1.175" y="0.875" dx="1.2" dy="1.1" layer="1" rot="R180"/>
<text x="0" y="1.524" size="0.6096" layer="25" font="vector" ratio="20" align="bottom-center">&gt;Name</text>
<text x="0" y="-1.524" size="0.6096" layer="27" font="vector" ratio="20" align="top-center">&gt;Value</text>
</package>
</packages>
<symbols>
<symbol name="CRYSTAL-GND">
<description>&lt;h3&gt;Crystal with Ground pin&lt;/h3&gt;</description>
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="1.778" x2="1.016" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="0" width="0.254" layer="94"/>
<text x="1.524" y="-1.524" size="1.778" layer="96" font="vector" align="top-left">&gt;VALUE</text>
<text x="-2.159" y="-1.143" size="0.8636" layer="93">1</text>
<text x="1.524" y="-1.143" size="0.8636" layer="93">2</text>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
<wire x1="-1.016" y1="0" x2="-1.016" y2="-1.778" width="0.254" layer="94"/>
<pin name="3" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<wire x1="0" y1="-2.8" x2="0" y2="-1.6" width="0.1524" layer="94"/>
<text x="-1.27" y="-1.524" size="1.778" layer="95" font="vector" align="top-right">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CRYSTAL-GROUNDED" prefix="Y">
<description>&lt;h3&gt;Crystals w/ Ground Pin (Generic)&lt;/h3&gt;
&lt;p&gt;These are &lt;b&gt;passive&lt;/b&gt; quartz crystals, which can be used as a clock source for a microcontroller.&lt;/p&gt;
&lt;p&gt;Crystal's are usually two-terminal devices. A third terminal may be optionally connected to ground, as recommended by the manufaturer.&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="CRYSTAL-GND" x="0" y="0"/>
</gates>
<devices>
<device name="SMD-5X3.2" package="CRYSTAL-SMD-5X3.2-4PAD">
<connects>
<connect gate="G$1" pin="1" pad="3"/>
<connect gate="G$1" pin="2" pad="1"/>
<connect gate="G$1" pin="3" pad="2 4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD-3.2X2.5" package="CRYSTAL-SMD-3.2X2.5MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="3"/>
<connect gate="G$1" pin="3" pad="2 4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-Passives">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
In this library you'll find resistors, capacitors, inductors, test points, jumper pads, etc.&lt;br&gt;&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is the end user's responsibility to ensure correctness and suitablity for a given componet or application. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="1206">
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.27" y="1.143" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.397" y="-1.524" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="AXIAL-0.3">
<wire x1="-2.54" y1="0.762" x2="2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0.762" x2="2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="-2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.794" y2="0" width="0.2032" layer="21"/>
<pad name="P$1" x="-3.81" y="0" drill="0.9" diameter="1.8796"/>
<pad name="P$2" x="3.81" y="0" drill="0.9" diameter="1.8796"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25" font="vector">&gt;Name</text>
<text x="-2.032" y="-0.381" size="1.016" layer="21" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="R2010">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-1.027" y1="1.245" x2="1.027" y2="1.245" width="0.1524" layer="21"/>
<wire x1="-1.002" y1="-1.245" x2="1.016" y2="-1.245" width="0.1524" layer="21"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-2.54" y="1.5875" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.032" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="0805">
<wire x1="-0.3" y1="0.6" x2="0.3" y2="0.6" width="0.1524" layer="21"/>
<wire x1="-0.3" y1="-0.6" x2="0.3" y2="-0.6" width="0.1524" layer="21"/>
<smd name="1" x="-0.9" y="0" dx="0.8" dy="1.2" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.8" dy="1.2" layer="1"/>
<text x="-0.762" y="0.8255" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.016" y="-1.397" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="0603-RES">
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.889" y="0.762" size="0.4064" layer="25" font="vector">&gt;NAME</text>
<text x="-1.016" y="-1.143" size="0.4064" layer="27" font="vector">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<rectangle x1="-0.2286" y1="-0.381" x2="0.2286" y2="0.381" layer="21"/>
</package>
<package name="0402-RES">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.889" y="0.6985" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.0795" y="-1.143" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<rectangle x1="-0.2032" y1="-0.3556" x2="0.2032" y2="0.3556" layer="21"/>
</package>
<package name="1/6W-RES">
<description>1/6W Thru-hole Resistor - *UNPROVEN*</description>
<wire x1="-1.55" y1="0.85" x2="-1.55" y2="-0.85" width="0.2032" layer="21"/>
<wire x1="-1.55" y1="-0.85" x2="1.55" y2="-0.85" width="0.2032" layer="21"/>
<wire x1="1.55" y1="-0.85" x2="1.55" y2="0.85" width="0.2032" layer="21"/>
<wire x1="1.55" y1="0.85" x2="-1.55" y2="0.85" width="0.2032" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="0.762"/>
<pad name="2" x="2.5" y="0" drill="0.762"/>
<text x="-1.2662" y="0.9552" size="0.6096" layer="25">&gt;NAME</text>
<text x="-1.423" y="-0.4286" size="0.8128" layer="21" ratio="15">&gt;VALUE</text>
</package>
<package name="R2512">
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
</package>
<package name="AXIAL-0.4">
<description>1/4W Resistor, 0.4" wide&lt;p&gt;

Yageo CFR series &lt;a href="http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf"&gt;http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf&lt;/a&gt;</description>
<wire x1="-3.15" y1="-1.2" x2="-3.15" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="1.2" x2="3.15" y2="1.2" width="0.2032" layer="21"/>
<wire x1="3.15" y1="1.2" x2="3.15" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-1.2" x2="-3.15" y2="-1.2" width="0.2032" layer="21"/>
<pad name="P$1" x="-5.08" y="0" drill="0.9" diameter="1.8796"/>
<pad name="P$2" x="5.08" y="0" drill="0.9" diameter="1.8796"/>
<text x="-3.175" y="1.905" size="0.8128" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="-2.286" y="-0.381" size="0.8128" layer="21" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="AXIAL-0.5">
<description>1/2W Resistor, 0.5" wide&lt;p&gt;

Yageo CFR series &lt;a href="http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf"&gt;http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf&lt;/a&gt;</description>
<wire x1="-4.5" y1="-1.65" x2="-4.5" y2="1.65" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="1.65" x2="4.5" y2="1.65" width="0.2032" layer="21"/>
<wire x1="4.5" y1="1.65" x2="4.5" y2="-1.65" width="0.2032" layer="21"/>
<wire x1="4.5" y1="-1.65" x2="-4.5" y2="-1.65" width="0.2032" layer="21"/>
<pad name="P$1" x="-6.35" y="0" drill="0.9" diameter="1.8796"/>
<pad name="P$2" x="6.35" y="0" drill="0.9" diameter="1.8796"/>
<text x="-4.445" y="2.54" size="0.8128" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="-3.429" y="-0.381" size="0.8128" layer="21" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="AXIAL-0.6">
<description>1W Resistor, 0.6" wide&lt;p&gt;

Yageo CFR series &lt;a href="http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf"&gt;http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf&lt;/a&gt;</description>
<wire x1="-5.75" y1="-2.25" x2="-5.75" y2="2.25" width="0.2032" layer="21"/>
<wire x1="-5.75" y1="2.25" x2="5.75" y2="2.25" width="0.2032" layer="21"/>
<wire x1="5.75" y1="2.25" x2="5.75" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="5.75" y1="-2.25" x2="-5.75" y2="-2.25" width="0.2032" layer="21"/>
<pad name="P$1" x="-7.62" y="0" drill="1.2" diameter="1.8796"/>
<pad name="P$2" x="7.62" y="0" drill="1.2" diameter="1.8796"/>
<text x="-5.715" y="3.175" size="0.8128" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="-4.064" y="-0.381" size="0.8128" layer="21" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="AXIAL-0.8">
<description>2W Resistor, 0.8" wide&lt;p&gt;

Yageo CFR series &lt;a href="http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf"&gt;http://www.yageo.com/pdf/yageo/Leaded-R_CFR_2008.pdf&lt;/a&gt;</description>
<wire x1="-7.75" y1="-2.5" x2="-7.75" y2="2.5" width="0.2032" layer="21"/>
<wire x1="-7.75" y1="2.5" x2="7.75" y2="2.5" width="0.2032" layer="21"/>
<wire x1="7.75" y1="2.5" x2="7.75" y2="-2.5" width="0.2032" layer="21"/>
<wire x1="7.75" y1="-2.5" x2="-7.75" y2="-2.5" width="0.2032" layer="21"/>
<pad name="P$1" x="-10.16" y="0" drill="1.2" diameter="1.8796"/>
<pad name="P$2" x="10.16" y="0" drill="1.2" diameter="1.8796"/>
<text x="-7.62" y="3.175" size="0.8128" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="-5.969" y="-0.381" size="0.8128" layer="21" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="AXIAL-0.3-KIT">
<description>&lt;h3&gt;AXIAL-0.3-KIT&lt;/h3&gt;

Commonly used for 1/4W through-hole resistors. 0.3" pitch between holes.&lt;br&gt;
&lt;br&gt;

&lt;b&gt;Warning:&lt;/b&gt; This is the KIT version of the AXIAL-0.3 package. This package has a smaller diameter top stop mask, which doesn't cover the diameter of the pad. This means only the bottom side of the pads' copper will be exposed. You'll only be able to solder to the bottom side.</description>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.254" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-1.27" width="0.254" layer="21"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="0" width="0.254" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="1.27" width="0.254" layer="21"/>
<wire x1="2.54" y1="0" x2="2.794" y2="0" width="0.254" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.794" y2="0" width="0.254" layer="21"/>
<pad name="P$1" x="-3.81" y="0" drill="1.016" diameter="2.032" stop="no"/>
<pad name="P$2" x="3.81" y="0" drill="1.016" diameter="2.032" stop="no"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25" font="vector">&gt;Name</text>
<text x="-2.159" y="-0.762" size="1.27" layer="21" font="vector" ratio="15">&gt;Value</text>
<polygon width="0.127" layer="30">
<vertex x="3.8201" y="-0.9449" curve="-90"/>
<vertex x="2.8652" y="-0.0152" curve="-90.011749"/>
<vertex x="3.8176" y="0.9602" curve="-90"/>
<vertex x="4.7676" y="-0.0178" curve="-90.024193"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="3.8176" y="-0.4369" curve="-90.012891"/>
<vertex x="3.3731" y="-0.0127" curve="-90"/>
<vertex x="3.8176" y="0.4546" curve="-90"/>
<vertex x="4.2595" y="-0.0025" curve="-90.012967"/>
</polygon>
<polygon width="0.127" layer="30">
<vertex x="-3.8075" y="-0.9525" curve="-90"/>
<vertex x="-4.7624" y="-0.0228" curve="-90.011749"/>
<vertex x="-3.81" y="0.9526" curve="-90"/>
<vertex x="-2.86" y="-0.0254" curve="-90.024193"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="-3.81" y="-0.4445" curve="-90.012891"/>
<vertex x="-4.2545" y="-0.0203" curve="-90"/>
<vertex x="-3.81" y="0.447" curve="-90"/>
<vertex x="-3.3681" y="-0.0101" curve="-90.012967"/>
</polygon>
</package>
<package name="AXIAL-0.3EZ">
<description>This is the "EZ" version of the standard .3" spaced resistor package.&lt;br&gt;
It has a reduced top mask to make it harder to install upside-down.</description>
<wire x1="-2.54" y1="0.762" x2="2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0.762" x2="2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="-2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.794" y2="0" width="0.2032" layer="21"/>
<pad name="P$1" x="-3.81" y="0" drill="0.9" diameter="1.8796" stop="no"/>
<pad name="P$2" x="3.81" y="0" drill="0.9" diameter="1.8796" stop="no"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25" font="vector">&gt;Name</text>
<text x="-2.032" y="-0.381" size="1.016" layer="21" font="vector" ratio="15">&gt;Value</text>
<circle x="-3.81" y="0" radius="0.508" width="0" layer="29"/>
<circle x="3.81" y="0" radius="0.523634375" width="0" layer="29"/>
<circle x="-3.81" y="0" radius="1.02390625" width="0" layer="30"/>
<circle x="3.81" y="0" radius="1.04726875" width="0" layer="30"/>
</package>
<package name="CAP-PTH-SMALL">
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="0.7" diameter="1.651"/>
<pad name="2" x="2.54" y="0" drill="0.7" diameter="1.651"/>
<text x="0.508" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="0.254" y="-1.524" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="CAP-PTH-SMALL2">
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="3.81" y2="1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="-1.27" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="1.27" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="0.7" diameter="1.651"/>
<pad name="2" x="2.54" y="0" drill="0.7" diameter="1.651"/>
<text x="-1.27" y="1.905" size="0.6096" layer="25">&gt;Name</text>
<text x="-1.27" y="-2.54" size="0.6096" layer="27">&gt;Value</text>
</package>
<package name="CAP-PTH-LARGE">
<wire x1="0" y1="0.635" x2="0" y2="0" width="0.2032" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="0" y1="0" x2="-2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="0" y1="0" x2="2.54" y2="0" width="0.2032" layer="21"/>
<pad name="1" x="-4.826" y="0" drill="0.9" diameter="1.905"/>
<pad name="2" x="4.572" y="0" drill="0.9" diameter="1.905"/>
<text x="-0.762" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-1.016" y="-1.524" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="GRM43D">
<wire x1="2.25" y1="1.6" x2="1.1" y2="1.6" width="0.127" layer="51"/>
<wire x1="1.1" y1="1.6" x2="-1.1" y2="1.6" width="0.127" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-2.25" y2="1.6" width="0.127" layer="51"/>
<wire x1="-2.25" y1="1.6" x2="-2.25" y2="-1.6" width="0.127" layer="51"/>
<wire x1="-2.25" y1="-1.6" x2="-1.1" y2="-1.6" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-1.6" x2="1.1" y2="-1.6" width="0.127" layer="51"/>
<wire x1="1.1" y1="-1.6" x2="2.25" y2="-1.6" width="0.127" layer="51"/>
<wire x1="2.25" y1="-1.6" x2="2.25" y2="1.6" width="0.127" layer="51"/>
<wire x1="1.1" y1="1.6" x2="1.1" y2="-1.6" width="0.127" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-1.1" y2="-1.6" width="0.127" layer="51"/>
<wire x1="-2.3" y1="1.8" x2="2.3" y2="1.8" width="0.127" layer="21"/>
<wire x1="-2.3" y1="-1.8" x2="2.3" y2="-1.8" width="0.127" layer="21"/>
<smd name="A" x="1.927" y="0" dx="3.2" dy="1.65" layer="1" rot="R90"/>
<smd name="C" x="-1.927" y="0" dx="3.2" dy="1.65" layer="1" rot="R90"/>
<text x="-2" y="2" size="0.4064" layer="25">&gt;NAME</text>
<text x="0" y="-2" size="0.4064" layer="27" rot="R180">&gt;VALUE</text>
<rectangle x1="-2.2" y1="-1.6" x2="-1.1" y2="1.6" layer="51"/>
<rectangle x1="1.1" y1="-1.6" x2="2.2" y2="1.6" layer="51"/>
</package>
<package name="0603-CAP">
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<wire x1="0" y1="0.0305" x2="0" y2="-0.0305" width="0.5588" layer="21"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.889" y="0.762" size="0.4064" layer="25" font="vector">&gt;NAME</text>
<text x="-1.016" y="-1.143" size="0.4064" layer="27" font="vector">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="0402-CAP">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="0" y1="0.0305" x2="0" y2="-0.0305" width="0.4064" layer="21"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.889" y="0.6985" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.0795" y="-1.143" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="CAP-PTH-5MM">
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="0.7" diameter="1.651"/>
<pad name="2" x="2.5" y="0" drill="0.7" diameter="1.651"/>
<text x="-0.762" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-1.016" y="-1.524" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="AXIAL-5MM">
<wire x1="-1.14" y1="0.762" x2="1.14" y2="0.762" width="0.2032" layer="21"/>
<wire x1="1.14" y1="0.762" x2="1.14" y2="0" width="0.2032" layer="21"/>
<wire x1="1.14" y1="0" x2="1.14" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="1.14" y1="-0.762" x2="-1.14" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-1.14" y1="-0.762" x2="-1.14" y2="0" width="0.2032" layer="21"/>
<wire x1="-1.14" y1="0" x2="-1.14" y2="0.762" width="0.2032" layer="21"/>
<wire x1="1.14" y1="0" x2="1.394" y2="0" width="0.2032" layer="21"/>
<wire x1="-1.14" y1="0" x2="-1.394" y2="0" width="0.2032" layer="21"/>
<pad name="P$1" x="-2.5" y="0" drill="0.9" diameter="1.8796"/>
<pad name="P$2" x="2.5" y="0" drill="0.9" diameter="1.8796"/>
<text x="-2.54" y="1.17" size="0.4" layer="25">&gt;Name</text>
<text x="-1.032" y="-0.208" size="0.4" layer="21" ratio="15">&gt;Value</text>
</package>
<package name="1210">
<wire x1="-1.6" y1="1.3" x2="1.6" y2="1.3" width="0.127" layer="51"/>
<wire x1="1.6" y1="1.3" x2="1.6" y2="-1.3" width="0.127" layer="51"/>
<wire x1="1.6" y1="-1.3" x2="-1.6" y2="-1.3" width="0.127" layer="51"/>
<wire x1="-1.6" y1="-1.3" x2="-1.6" y2="1.3" width="0.127" layer="51"/>
<wire x1="-1.6" y1="1.3" x2="1.6" y2="1.3" width="0.2032" layer="21"/>
<wire x1="-1.6" y1="-1.3" x2="1.6" y2="-1.3" width="0.2032" layer="21"/>
<smd name="1" x="-1.6" y="0" dx="1.2" dy="2" layer="1"/>
<smd name="2" x="1.6" y="0" dx="1.2" dy="2" layer="1"/>
<text x="-0.8" y="0.5" size="0.4064" layer="25">&gt;NAME</text>
<text x="-0.9" y="-0.7" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="CTZ3">
<description>CTZ3 Series land pattern for variable capacitor - CTZ3E-50C-W1-PF</description>
<wire x1="-1.6" y1="1.4" x2="-1.6" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-1.6" y1="-2.25" x2="1.6" y2="-2.25" width="0.127" layer="51"/>
<wire x1="1.6" y1="1.4" x2="1.6" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0" x2="0.5" y2="0" width="0.127" layer="51"/>
<wire x1="-1.6" y1="1.4" x2="-1" y2="2.2" width="0.127" layer="51"/>
<wire x1="1.6" y1="1.4" x2="1" y2="2.2" width="0.127" layer="51"/>
<wire x1="-1" y1="2.2" x2="1" y2="2.2" width="0.127" layer="51"/>
<wire x1="0" y1="0.8" x2="0" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-0.8" y1="0" x2="0.8" y2="0" width="0.127" layer="51"/>
<wire x1="-1.05" y1="2.25" x2="-1.7" y2="1.45" width="0.127" layer="21"/>
<wire x1="-1.7" y1="1.45" x2="-1.7" y2="-2.35" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-2.35" x2="-1.05" y2="-2.35" width="0.127" layer="21"/>
<wire x1="1.05" y1="2.25" x2="1.7" y2="1.4" width="0.127" layer="21"/>
<wire x1="1.7" y1="1.4" x2="1.7" y2="-2.35" width="0.127" layer="21"/>
<wire x1="1.7" y1="-2.35" x2="1.05" y2="-2.35" width="0.127" layer="21"/>
<smd name="+" x="0" y="2.05" dx="1.5" dy="1.2" layer="1"/>
<smd name="-" x="0" y="-2.05" dx="1.5" dy="1.2" layer="1"/>
<text x="-2" y="3" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2" y="-3.4" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="CAP-PTH-SMALL-KIT">
<description>&lt;h3&gt;CAP-PTH-SMALL-KIT&lt;/h3&gt;
Commonly used for small ceramic capacitors. Like our 0.1uF (http://www.sparkfun.com/products/8375) or 22pF caps (http://www.sparkfun.com/products/8571).&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Warning:&lt;/b&gt; This is the KIT version of this package. This package has a smaller diameter top stop mask, which doesn't cover the diameter of the pad. This means only the bottom side of the pads' copper will be exposed. You'll only be able to solder to the bottom side.</description>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.254" layer="21"/>
<wire x1="-2.667" y1="1.27" x2="2.667" y2="1.27" width="0.254" layer="21"/>
<wire x1="2.667" y1="1.27" x2="2.667" y2="-1.27" width="0.254" layer="21"/>
<wire x1="2.667" y1="-1.27" x2="-2.667" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-2.667" y1="-1.27" x2="-2.667" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-1.397" y="0" drill="1.016" diameter="2.032" stop="no"/>
<pad name="2" x="1.397" y="0" drill="1.016" diameter="2.032" stop="no"/>
<polygon width="0.127" layer="30">
<vertex x="-1.4021" y="-0.9475" curve="-90"/>
<vertex x="-2.357" y="-0.0178" curve="-90.011749"/>
<vertex x="-1.4046" y="0.9576" curve="-90"/>
<vertex x="-0.4546" y="-0.0204" curve="-90.024193"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="-1.4046" y="-0.4395" curve="-90.012891"/>
<vertex x="-1.8491" y="-0.0153" curve="-90"/>
<vertex x="-1.4046" y="0.452" curve="-90"/>
<vertex x="-0.9627" y="-0.0051" curve="-90.012967"/>
</polygon>
<polygon width="0.127" layer="30">
<vertex x="1.397" y="-0.9475" curve="-90"/>
<vertex x="0.4421" y="-0.0178" curve="-90.011749"/>
<vertex x="1.3945" y="0.9576" curve="-90"/>
<vertex x="2.3445" y="-0.0204" curve="-90.024193"/>
</polygon>
<polygon width="0.127" layer="29">
<vertex x="1.3945" y="-0.4395" curve="-90.012891"/>
<vertex x="0.95" y="-0.0153" curve="-90"/>
<vertex x="1.3945" y="0.452" curve="-90"/>
<vertex x="1.8364" y="-0.0051" curve="-90.012967"/>
</polygon>
</package>
<package name="CAP-PTH-SMALLEZ">
<description>This is the "EZ" version of the .1" spaced ceramic thru-hole cap.&lt;br&gt;
It has reduced top mask to make it harder to put the component on the wrong side of the board.</description>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="3.81" y2="1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="-1.27" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="1.27" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="0.7" diameter="1.651" stop="no"/>
<pad name="2" x="2.54" y="0" drill="0.7" diameter="1.651" stop="no"/>
<text x="-1.27" y="1.905" size="0.6096" layer="25">&gt;Name</text>
<text x="-1.27" y="-2.54" size="0.6096" layer="27">&gt;Value</text>
<circle x="0" y="0" radius="0.898025" width="0" layer="30"/>
<circle x="2.54" y="0" radius="0.915809375" width="0" layer="30"/>
<circle x="0" y="0" radius="0.40160625" width="0" layer="29"/>
<circle x="2.54" y="0" radius="0.40160625" width="0" layer="29"/>
</package>
<package name="INDUCTOR-1206">
<wire x1="-1.778" y1="2.032" x2="-3.81" y2="2.032" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.032" x2="-3.81" y2="-2.032" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.032" x2="-1.524" y2="-2.032" width="0.127" layer="21"/>
<wire x1="1.524" y1="2.032" x2="3.81" y2="2.032" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.032" x2="3.81" y2="-2.032" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.032" x2="1.524" y2="-2.032" width="0.127" layer="21"/>
<smd name="P$1" x="-2.54" y="0" dx="3.556" dy="2.032" layer="1" rot="R90"/>
<smd name="P$2" x="2.54" y="0" dx="3.556" dy="2.032" layer="1" rot="R90"/>
<text x="-1.27" y="2.54" size="0.4064" layer="25">&gt;Name</text>
<text x="-1.27" y="-2.54" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="0603">
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.889" y="0.762" size="0.4064" layer="25" font="vector">&gt;NAME</text>
<text x="-1.016" y="-1.143" size="0.4064" layer="27" font="vector">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<circle x="0" y="0" radius="0.127" width="0.127" layer="21"/>
<circle x="0" y="0" radius="0.0254" width="0.127" layer="21"/>
<circle x="0" y="0" radius="0.218496875" width="0.127" layer="21"/>
</package>
<package name="CR54">
<description>From: http://www.niccomp.com/catalog/npis_ls.pdf</description>
<wire x1="2.6" y1="2.6" x2="-2.6" y2="2.6" width="0.127" layer="51"/>
<wire x1="-2.6" y1="2.6" x2="-2.6" y2="-2.6" width="0.127" layer="51"/>
<wire x1="-2.6" y1="-2.6" x2="2.6" y2="-2.6" width="0.127" layer="51"/>
<wire x1="2.6" y1="-2.6" x2="2.6" y2="2.6" width="0.127" layer="51"/>
<wire x1="-2.87" y1="2.6" x2="-2.87" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="-2.87" x2="2.6" y2="-2.87" width="0.2032" layer="21"/>
<wire x1="2.87" y1="-2.6" x2="2.87" y2="2.6" width="0.2032" layer="21"/>
<wire x1="2.6" y1="2.87" x2="-2.6" y2="2.87" width="0.2032" layer="21"/>
<smd name="P$1" x="0" y="1.85" dx="4.2" dy="1.4" layer="1"/>
<smd name="P$2" x="0" y="-1.85" dx="4.2" dy="1.4" layer="1"/>
<text x="-2.04" y="0.41" size="0.4064" layer="25">&gt;Name</text>
<text x="-2.04" y="-0.59" size="0.4064" layer="27">&gt;Value</text>
<rectangle x1="-2.1" y1="1.15" x2="2.1" y2="2.55" layer="51"/>
<rectangle x1="-2.1" y1="-2.55" x2="2.1" y2="-1.15" layer="51"/>
<wire x1="-2.87" y1="-2.6" x2="-2.6" y2="-2.87" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-2.87" x2="2.87" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="-2.87" y1="2.6" x2="-2.6" y2="2.87" width="0.2032" layer="21"/>
<wire x1="2.6" y1="2.87" x2="2.87" y2="2.6" width="0.2032" layer="21"/>
</package>
<package name="CDRH125">
<wire x1="-3.5" y1="6" x2="-6" y2="6" width="0.2032" layer="21"/>
<wire x1="-6" y1="6" x2="-6" y2="-6" width="0.2032" layer="21"/>
<wire x1="-6" y1="-6" x2="-3.5" y2="-6" width="0.2032" layer="21"/>
<wire x1="3.5" y1="-6" x2="6" y2="-6" width="0.2032" layer="21"/>
<wire x1="6" y1="-6" x2="6" y2="6" width="0.2032" layer="21"/>
<wire x1="6" y1="6" x2="3.5" y2="6" width="0.2032" layer="21"/>
<smd name="1" x="0" y="4.9" dx="5.4" dy="4" layer="1"/>
<smd name="2" x="0" y="-4.9" dx="5.4" dy="4" layer="1"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-2.54" y="-1.27" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="C0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.889" y="0.6985" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.0795" y="-1.143" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="B82462G">
<wire x1="3.15" y1="3.15" x2="-3.15" y2="3.15" width="0.127" layer="51"/>
<wire x1="-3.15" y1="3.15" x2="-3.15" y2="-3.15" width="0.127" layer="51"/>
<wire x1="-3.15" y1="-3.15" x2="3.15" y2="-3.15" width="0.127" layer="51"/>
<wire x1="3.15" y1="-3.15" x2="3.15" y2="3.15" width="0.127" layer="51"/>
<wire x1="-3.15" y1="3.15" x2="-2" y2="3.15" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="3.15" x2="-3.15" y2="-3.15" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="-3.15" x2="-2" y2="-3.15" width="0.2032" layer="21"/>
<wire x1="2" y1="-3.15" x2="3.15" y2="-3.15" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-3.15" x2="3.15" y2="3.15" width="0.2032" layer="21"/>
<wire x1="3.15" y1="3.15" x2="2" y2="3.15" width="0.2032" layer="21"/>
<smd name="P$1" x="0" y="2.75" dx="2.4" dy="1.5" layer="1"/>
<smd name="P$2" x="0" y="-2.75" dx="2.4" dy="1.5" layer="1"/>
</package>
<package name="CR75">
<wire x1="-1" y1="3.65" x2="7" y2="3.65" width="0.127" layer="21"/>
<wire x1="7" y1="3.65" x2="7" y2="2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="3.65" x2="-1" y2="2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="-3.65" x2="7" y2="-3.65" width="0.127" layer="21"/>
<wire x1="7" y1="-3.65" x2="7" y2="-2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="-3.65" x2="-1" y2="-2.55" width="0.127" layer="21"/>
<smd name="P$1" x="0" y="0" dx="4.7" dy="1.75" layer="1" rot="R90"/>
<smd name="P$2" x="6.05" y="0" dx="4.7" dy="1.75" layer="1" rot="R90"/>
</package>
<package name="1007">
<description>1007 (2518 metric) package</description>
<wire x1="0.9" y1="1.25" x2="-0.9" y2="1.25" width="0.127" layer="51"/>
<wire x1="-0.9" y1="1.25" x2="-0.9" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-0.9" y1="-1.25" x2="0.9" y2="-1.25" width="0.127" layer="51"/>
<wire x1="0.9" y1="-1.25" x2="0.9" y2="1.25" width="0.127" layer="51"/>
<wire x1="-1" y1="-0.4" x2="-1" y2="0.4" width="0.127" layer="21"/>
<wire x1="1" y1="-0.4" x2="1" y2="0.4" width="0.127" layer="21"/>
<smd name="1" x="0" y="1" dx="2" dy="0.8" layer="1"/>
<smd name="2" x="0" y="-1" dx="2" dy="0.8" layer="1"/>
<text x="-1" y="1.6" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1" y="-2" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="COOPER_UP4B">
<wire x1="-6.3" y1="7" x2="-7.5" y2="2" width="0.2032" layer="21"/>
<wire x1="-7.5" y1="2" x2="-7.5" y2="-2" width="0.2032" layer="21"/>
<wire x1="-7.5" y1="-2" x2="-6.3" y2="-7" width="0.2032" layer="21"/>
<wire x1="7.5" y1="2" x2="7.5" y2="-2" width="0.2032" layer="21"/>
<wire x1="7.5" y1="2" x2="6.3" y2="7" width="0.2032" layer="21"/>
<wire x1="7.5" y1="-2" x2="6.3" y2="-7" width="0.2032" layer="21"/>
<smd name="1" x="0" y="8.9" dx="12" dy="4.3" layer="1"/>
<smd name="2" x="0" y="-8.9" dx="12" dy="4.3" layer="1"/>
<text x="-2.54" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-2.54" y="-1.27" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="CDRH3D28">
<wire x1="-2.0503" y1="-0.677" x2="-2.0505" y2="0.6629" width="0.127" layer="51"/>
<wire x1="0.6192" y1="1.9926" x2="-0.7206" y2="1.9927" width="0.127" layer="51"/>
<wire x1="1.9491" y1="0.6627" x2="1.9491" y2="-0.677" width="0.127" layer="51"/>
<wire x1="-2.0505" y1="0.6629" x2="-0.7206" y2="1.9927" width="0.127" layer="51"/>
<wire x1="1.9491" y1="0.6627" x2="0.6192" y2="1.9926" width="0.127" layer="51"/>
<wire x1="1.9503" y1="-0.6737" x2="-0.0506" y2="-2.6748" width="0.127" layer="51"/>
<wire x1="-0.0436" y1="-2.6999" x2="1.2914" y2="-1.3649" width="0.127" layer="21"/>
<wire x1="-0.0436" y1="-2.6999" x2="-1.3785" y2="-1.3649" width="0.127" layer="21"/>
<wire x1="-2.0434" y1="-0.68" x2="-0.0535" y2="-2.6698" width="0.127" layer="51"/>
<wire x1="-1.7435" y1="1" x2="-0.7895" y2="1.954" width="0.127" layer="21"/>
<wire x1="1.6563" y1="0.9999" x2="0.7024" y2="1.9538" width="0.127" layer="21"/>
<smd name="2" x="1.849" y="-0.007" dx="1.5" dy="1.4" layer="1" rot="R270"/>
<smd name="1" x="-1.9504" y="-0.007" dx="1.5" dy="1.4" layer="1" rot="R270"/>
<text x="-2.492" y="2.524" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2.492" y="-3.27" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="CR75_V2">
<wire x1="-1" y1="3.65" x2="7" y2="3.65" width="0.127" layer="21"/>
<wire x1="7" y1="3.65" x2="7" y2="2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="3.65" x2="-1" y2="2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="-3.65" x2="7" y2="-3.65" width="0.127" layer="21"/>
<wire x1="7" y1="-3.65" x2="7" y2="-2.55" width="0.127" layer="21"/>
<wire x1="-1" y1="-3.65" x2="-1" y2="-2.55" width="0.127" layer="21"/>
<smd name="P$1" x="-0.254" y="0" dx="2.54" dy="1.524" layer="1" rot="R90"/>
<smd name="P$2" x="6.304" y="0" dx="2.54" dy="1.524" layer="1" rot="R90"/>
</package>
<package name="CDRH2D09">
<description>1.3x1.3mm 1.7mm between. Fits Sumida CDRH2D09, CDRH2D18 inductor</description>
<wire x1="-1.2" y1="0.9" x2="-0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="1.5" x2="0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="0.6" y1="1.5" x2="1.2" y2="0.9" width="0.2032" layer="21"/>
<wire x1="-1.2" y1="-0.9" x2="-0.6783" y2="-1.3739" width="0.2032" layer="21"/>
<wire x1="-0.6783" y1="-1.3739" x2="0.6783" y2="-1.3739" width="0.2032" layer="21" curve="85.420723"/>
<wire x1="0.6783" y1="-1.3739" x2="1.2" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="-1.5" y1="-0.6" x2="-0.7071" y2="-1.3929" width="0.03" layer="51"/>
<wire x1="-0.7071" y1="-1.3929" x2="0.7071" y2="-1.3929" width="0.03" layer="51" curve="90"/>
<wire x1="0.7071" y1="-1.3929" x2="1.5" y2="-0.6" width="0.03" layer="51"/>
<wire x1="1.5" y1="-0.6" x2="1.5" y2="0.6" width="0.03" layer="51"/>
<wire x1="1.5" y1="0.6" x2="0.6" y2="1.5" width="0.03" layer="51"/>
<wire x1="0.6" y1="1.5" x2="-0.6" y2="1.5" width="0.03" layer="51"/>
<wire x1="-0.6" y1="1.5" x2="-1.5" y2="0.6" width="0.03" layer="51"/>
<wire x1="-1.5" y1="0.6" x2="-1.5" y2="-0.6" width="0.03" layer="51"/>
<smd name="P$1" x="-1.5" y="0" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<smd name="P$2" x="1.5" y="0" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<text x="2.8" y="0.7" size="0.4064" layer="25">&gt;NAME</text>
<text x="2.8" y="-1" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="NPI75C">
<wire x1="-3.9" y1="3.5" x2="-3.9" y2="-3.5" width="0.1778" layer="51"/>
<wire x1="-3.9" y1="-3.5" x2="3.9" y2="-3.5" width="0.1778" layer="51"/>
<wire x1="3.9" y1="-3.5" x2="3.9" y2="3.5" width="0.1778" layer="51"/>
<wire x1="0.8" y1="3.5" x2="-0.8" y2="3.5" width="0.1778" layer="21"/>
<wire x1="-0.8" y1="-3.5" x2="0.8" y2="-3.5" width="0.1778" layer="21"/>
<wire x1="3.9" y1="3.5" x2="-3.9" y2="3.5" width="0.1778" layer="51"/>
<smd name="1" x="-2.5" y="0" dx="3" dy="7.5" layer="1"/>
<smd name="2" x="2.5" y="0" dx="3" dy="7.5" layer="1"/>
</package>
<package name="SRU5028">
<wire x1="1.2048" y1="-2.473" x2="2.4476" y2="-1.2048" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-0.9" x2="2.6" y2="0.9" width="0.2032" layer="51"/>
<wire x1="2.473" y1="1.2048" x2="1.2048" y2="2.4476" width="0.2032" layer="21"/>
<wire x1="0.9" y1="2.6" x2="-0.9" y2="2.6" width="0.2032" layer="51"/>
<wire x1="-1.1794" y1="2.4222" x2="-2.4222" y2="1.2048" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="0.9" x2="-2.6" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-2.3968" y1="-1.1794" x2="-1.2048" y2="-2.4476" width="0.2032" layer="21"/>
<wire x1="-0.9" y1="-2.6" x2="0.9" y2="-2.6" width="0.2032" layer="51"/>
<circle x="1.5" y="0" radius="0.1414" width="0.4" layer="21"/>
<smd name="P$1" x="0" y="2.4" dx="2" dy="1.1" layer="1"/>
<smd name="P$2" x="0" y="-2.4" dx="2" dy="1.1" layer="1"/>
<smd name="1" x="2.4" y="0" dx="2" dy="1.1" layer="1" rot="R90"/>
<smd name="2" x="-2.4" y="0" dx="2" dy="1.1" layer="1" rot="R90"/>
<text x="-2.54" y="3.175" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="SRU1038">
<wire x1="-5" y1="-1.6" x2="-5" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-5" y1="1.6" x2="-1.6" y2="5" width="0.2032" layer="51"/>
<wire x1="-1.6" y1="5" x2="1.6" y2="5" width="0.2032" layer="51"/>
<wire x1="1.6" y1="5" x2="5" y2="1.6" width="0.2032" layer="51"/>
<wire x1="5" y1="1.6" x2="5" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="5" y1="-1.6" x2="1.6" y2="-5" width="0.2032" layer="51"/>
<wire x1="1.6" y1="-5" x2="-1.6" y2="-5" width="0.2032" layer="51"/>
<wire x1="-1.6" y1="-5" x2="-5" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-4.5" y1="2.1" x2="-1.6" y2="5" width="0.254" layer="21"/>
<wire x1="-1.6" y1="5" x2="1.6" y2="5" width="0.254" layer="21"/>
<wire x1="1.6" y1="-5" x2="-1.6" y2="-5" width="0.254" layer="21"/>
<wire x1="1.6" y1="5" x2="4.5" y2="2.1" width="0.254" layer="21"/>
<wire x1="-4.5" y1="-2.1" x2="-1.6" y2="-5" width="0.254" layer="21"/>
<wire x1="1.6" y1="-5" x2="4.5" y2="-2.1" width="0.254" layer="21"/>
<smd name="2" x="4.5" y="0" dx="1.8" dy="3.6" layer="1"/>
<smd name="1" x="-4.5" y="0" dx="1.8" dy="3.6" layer="1"/>
<text x="-2.54" y="2.54" size="1.016" layer="25">&gt;Name</text>
<text x="-2.54" y="-3.302" size="1.016" layer="27">&gt;Value</text>
</package>
<package name="CR54-KIT">
<wire x1="-3.048" y1="-3.548" x2="-2.794" y2="-3.802" width="0.2032" layer="21"/>
<wire x1="-2.794" y1="-3.802" x2="2.794" y2="-3.802" width="0.2032" layer="21"/>
<wire x1="2.794" y1="-3.802" x2="3.048" y2="-3.548" width="0.2032" layer="21"/>
<wire x1="3.048" y1="-3.548" x2="3.048" y2="3.548" width="0.2032" layer="21"/>
<wire x1="3.048" y1="3.548" x2="2.794" y2="3.802" width="0.2032" layer="21"/>
<wire x1="2.794" y1="3.802" x2="-2.794" y2="3.802" width="0.2032" layer="21"/>
<wire x1="-2.794" y1="3.802" x2="-3.048" y2="3.548" width="0.2032" layer="21"/>
<wire x1="-3.048" y1="3.548" x2="-3.048" y2="-3.548" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.1778" layer="51"/>
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.1778" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.1778" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.1778" layer="51"/>
<circle x="0" y="0.508" radius="0.127" width="0.2032" layer="21"/>
<smd name="P$1" x="0" y="2.17" dx="5" dy="2.65" layer="1"/>
<smd name="P$2" x="0" y="-2.17" dx="5" dy="2.65" layer="1"/>
<text x="-2.54" y="4.01" size="0.4064" layer="25">&gt;Name</text>
<text x="-2.7" y="-4.39" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="DR1030">
<description>For Coiltronics/Cooper DR1030 series inductors</description>
<wire x1="5.15" y1="5.25" x2="5.15" y2="-5.25" width="0.127" layer="21"/>
<wire x1="-5.15" y1="-5.25" x2="-5.15" y2="5.25" width="0.127" layer="21"/>
<smd name="2" x="0" y="-4.45" dx="3.3" dy="1.6" layer="1"/>
<smd name="1" x="0" y="4.45" dx="3.3" dy="1.6" layer="1"/>
<wire x1="5.15" y1="-5.25" x2="2" y2="-5.25" width="0.127" layer="21"/>
<wire x1="-5.15" y1="-5.25" x2="-2" y2="-5.25" width="0.127" layer="21"/>
<wire x1="-5.15" y1="5.25" x2="-2" y2="5.25" width="0.127" layer="21"/>
<wire x1="5.15" y1="5.25" x2="2" y2="5.25" width="0.127" layer="21"/>
<text x="-3.81" y="1.27" size="0.4064" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.27" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="VLF4012A">
<wire x1="-1.85" y1="0.925" x2="-0.925" y2="1.85" width="0.127" layer="21"/>
<wire x1="-0.925" y1="1.85" x2="0.925" y2="1.85" width="0.127" layer="21"/>
<wire x1="0.925" y1="1.85" x2="1.85" y2="0.925" width="0.127" layer="21"/>
<wire x1="1.85" y1="0.925" x2="1.85" y2="-0.925" width="0.127" layer="21"/>
<wire x1="1.85" y1="-0.925" x2="0.925" y2="-1.85" width="0.127" layer="21"/>
<wire x1="-0.925" y1="-1.85" x2="-1.85" y2="-0.925" width="0.127" layer="21"/>
<wire x1="-1.85" y1="0.925" x2="-1.85" y2="-0.925" width="0.127" layer="21"/>
<wire x1="-0.925" y1="-1.85" x2="0.925" y2="-1.85" width="0.127" layer="21"/>
<smd name="P$1" x="-1.9" y="0" dx="0.9" dy="1.3" layer="1"/>
<smd name="P$2" x="1.9" y="0" dx="0.9" dy="1.3" layer="1"/>
</package>
<package name="RLB0912">
<circle x="0" y="0" radius="4.445" width="0.2032" layer="21"/>
<pad name="2" x="-2.5019" y="0" drill="0.8128" diameter="1.651"/>
<text x="-1.905" y="-3.048" size="0.8128" layer="27">&gt;Value</text>
<text x="-0.762" y="2.921" size="0.4064" layer="25">&gt;Name</text>
<pad name="1" x="2.5019" y="0" drill="0.8128" diameter="1.651"/>
</package>
<package name="SRN6045">
<smd name="1" x="-2.175" y="-0.175" dx="6" dy="2.5" layer="1" rot="R90"/>
<smd name="2" x="2.125" y="-0.175" dx="6" dy="2.5" layer="1" rot="R90"/>
<wire x1="-2.175" y1="-3.175" x2="-3.175" y2="-2.175" width="0.127" layer="51"/>
<wire x1="-3.175" y1="-2.175" x2="-3.175" y2="1.825" width="0.127" layer="51"/>
<wire x1="-3.175" y1="1.825" x2="-2.175" y2="2.825" width="0.127" layer="51"/>
<wire x1="-2.175" y1="2.825" x2="2.125" y2="2.825" width="0.127" layer="51"/>
<wire x1="2.125" y1="2.825" x2="3.125" y2="1.825" width="0.127" layer="51"/>
<wire x1="3.125" y1="1.825" x2="3.125" y2="-2.175" width="0.127" layer="51"/>
<wire x1="3.125" y1="-2.175" x2="2.125" y2="-3.175" width="0.127" layer="51"/>
<wire x1="2.125" y1="-3.175" x2="-2.175" y2="-3.175" width="0.127" layer="51"/>
<text x="-4.175" y="3.825" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.175" y="-5.175" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-0.762" y1="2.794" x2="0.762" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-3.175" x2="0.762" y2="-3.175" width="0.1524" layer="21"/>
</package>
<package name="SDR0403">
<description>Footprint for Bourns SDR0403 family inductors</description>
<smd name="P$1" x="-1.65" y="0" dx="4.5" dy="1.8" layer="1" rot="R90"/>
<smd name="P$2" x="1.65" y="0" dx="4.5" dy="1.8" layer="1" rot="R90"/>
<wire x1="-0.5" y1="2" x2="0.5" y2="2" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-2" x2="0.5" y2="-2" width="0.127" layer="21"/>
<text x="-0.762" y="-0.254" size="0.4064" layer="27">&gt;VALUE</text>
<text x="-0.889" y="1.016" size="0.4064" layer="25">&gt;NAME</text>
</package>
<package name="INDUCTOR-SRP4020">
<smd name="P$1" x="-2.05" y="0" dx="1.5" dy="1.9" layer="1" rot="R90"/>
<smd name="P$2" x="2.05" y="0" dx="1.5" dy="1.9" layer="1" rot="R90"/>
<wire x1="-2" y1="2" x2="2" y2="2" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="2" x2="-2" y2="1.5" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="2" y2="1.5" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="2" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-2" y2="-1.5" width="0.127" layer="21"/>
<text x="-2.032" y="2.286" size="0.8128" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2.032" y="-3.048" size="0.8128" layer="25" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="INDUCTOR_4.7UH">
<wire x1="-1.2" y1="0.9" x2="-0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="1.5" x2="0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="0.6" y1="1.5" x2="1.2" y2="0.9" width="0.2032" layer="21"/>
<wire x1="-1.2" y1="-0.9" x2="-0.6783" y2="-1.3739" width="0.2032" layer="21"/>
<wire x1="-0.6783" y1="-1.3739" x2="0.6783" y2="-1.3739" width="0.2032" layer="21" curve="85.420723"/>
<wire x1="0.6783" y1="-1.3739" x2="1.2" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="-1.5" y1="-0.6" x2="-0.7071" y2="-1.3929" width="0.03" layer="51"/>
<wire x1="-0.7071" y1="-1.3929" x2="0.7071" y2="-1.3929" width="0.03" layer="51" curve="90"/>
<wire x1="0.7071" y1="-1.3929" x2="1.5" y2="-0.6" width="0.03" layer="51"/>
<wire x1="1.5" y1="-0.6" x2="1.5" y2="0.6" width="0.03" layer="51"/>
<wire x1="1.5" y1="0.6" x2="0.6" y2="1.5" width="0.03" layer="51"/>
<wire x1="0.6" y1="1.5" x2="-0.6" y2="1.5" width="0.03" layer="51"/>
<wire x1="-0.6" y1="1.5" x2="-1.5" y2="0.6" width="0.03" layer="51"/>
<wire x1="-1.5" y1="0.6" x2="-1.5" y2="-0.6" width="0.03" layer="51"/>
<smd name="P$1" x="-1.5" y="0" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<smd name="P$2" x="1.5" y="0" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<text x="2.8" y="0.7" size="0.4064" layer="25">&gt;NAME</text>
<text x="2.8" y="-1" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="INDUCTOR_SDR1307">
<smd name="P$1" x="0" y="4.6" dx="14" dy="4.75" layer="1"/>
<smd name="P$2" x="0" y="-4.6" dx="14" dy="4.75" layer="1"/>
<wire x1="-6.5" y1="1.5" x2="-6.5" y2="-1.5" width="0.3048" layer="21"/>
<wire x1="6.5" y1="1.5" x2="6.5" y2="-1.5" width="0.3048" layer="21"/>
<text x="-7" y="7.5" size="0.8128" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-7" y="-8.5" size="0.8128" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="EIA3216">
<wire x1="-1" y1="-1.2" x2="-2.5" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-1.2" x2="-2.5" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="1.2" x2="-1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="1" y1="-1.2" x2="2.1" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="2.1" y1="-1.2" x2="2.5" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="2.5" y1="-0.8" x2="2.5" y2="0.8" width="0.2032" layer="21"/>
<wire x1="2.5" y1="0.8" x2="2.1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="2.1" y1="1.2" x2="1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.381" y2="-1.016" width="0.127" layer="21"/>
<smd name="C" x="-1.4" y="0" dx="1.6" dy="1.4" layer="1" rot="R90"/>
<smd name="A" x="1.4" y="0" dx="1.6" dy="1.4" layer="1" rot="R90"/>
<text x="-2.54" y="1.381" size="0.4064" layer="25">&gt;NAME</text>
<text x="0.408" y="1.332" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="EIA3528">
<wire x1="-0.9" y1="-1.6" x2="-2.6" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="-1.6" x2="-2.6" y2="1.55" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="1.55" x2="-0.9" y2="1.55" width="0.2032" layer="21"/>
<wire x1="1" y1="-1.55" x2="2.2" y2="-1.55" width="0.2032" layer="21"/>
<wire x1="2.2" y1="-1.55" x2="2.6" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-1.2" x2="2.6" y2="1.25" width="0.2032" layer="21"/>
<wire x1="2.6" y1="1.25" x2="2.2" y2="1.55" width="0.2032" layer="21"/>
<wire x1="2.2" y1="1.55" x2="1" y2="1.55" width="0.2032" layer="21"/>
<wire x1="2.2" y1="1.55" x2="1" y2="1.55" width="0.2032" layer="21"/>
<wire x1="0.609" y1="1.311" x2="0.609" y2="-1.286" width="0.2032" layer="21" style="longdash"/>
<smd name="C" x="-1.65" y="0" dx="2.5" dy="1.2" layer="1" rot="R90"/>
<smd name="A" x="1.65" y="0" dx="2.5" dy="1.2" layer="1" rot="R90"/>
<text x="-2.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.24" y="-1.37" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="CPOL-RADIAL-100UF-25V">
<wire x1="-0.635" y1="1.27" x2="-1.905" y2="1.27" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="3.25" width="0.2032" layer="21"/>
<pad name="2" x="-1.27" y="0" drill="0.7" diameter="1.651"/>
<pad name="1" x="1.27" y="0" drill="0.7" diameter="1.651" shape="square"/>
<text x="-1.905" y="-4.318" size="0.8128" layer="27">&gt;Value</text>
<text x="-0.762" y="1.651" size="0.4064" layer="25">&gt;Name</text>
</package>
<package name="CPOL-RADIAL-10UF-25V">
<wire x1="-0.762" y1="1.397" x2="-1.778" y2="1.397" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.5" width="0.2032" layer="21"/>
<pad name="1" x="1.27" y="0" drill="0.7" diameter="1.651" shape="square"/>
<pad name="2" x="-1.27" y="0" drill="0.7" diameter="1.651"/>
<text x="-0.889" y="1.524" size="0.4064" layer="25">&gt;Name</text>
<text x="-1.905" y="-3.683" size="0.8128" layer="27">&gt;Value</text>
</package>
<package name="EIA7343">
<wire x1="-5" y1="2.5" x2="-2" y2="2.5" width="0.2032" layer="21"/>
<wire x1="-5" y1="2.5" x2="-5" y2="-2.5" width="0.2032" layer="21"/>
<wire x1="-5" y1="-2.5" x2="-2" y2="-2.5" width="0.2032" layer="21"/>
<wire x1="2" y1="2.5" x2="4" y2="2.5" width="0.2032" layer="21"/>
<wire x1="4" y1="2.5" x2="5" y2="1.5" width="0.2032" layer="21"/>
<wire x1="5" y1="1.5" x2="5" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="5" y1="-1.5" x2="4" y2="-2.5" width="0.2032" layer="21"/>
<wire x1="4" y1="-2.5" x2="2" y2="-2.5" width="0.2032" layer="21"/>
<smd name="C" x="-3.17" y="0" dx="2.55" dy="2.7" layer="1" rot="R180"/>
<smd name="A" x="3.17" y="0" dx="2.55" dy="2.7" layer="1" rot="R180"/>
<text x="-1.27" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-1.27" y="-1.27" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="PANASONIC_G">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package G&lt;/b&gt;</description>
<wire x1="-5.1" y1="5.1" x2="2.8" y2="5.1" width="0.1016" layer="51"/>
<wire x1="2.8" y1="5.1" x2="5.1" y2="2.8" width="0.1016" layer="51"/>
<wire x1="5.1" y1="2.8" x2="5.1" y2="-2.8" width="0.1016" layer="51"/>
<wire x1="5.1" y1="-2.8" x2="2.8" y2="-5.1" width="0.1016" layer="51"/>
<wire x1="2.8" y1="-5.1" x2="-5.1" y2="-5.1" width="0.1016" layer="51"/>
<wire x1="-5.1" y1="-5.1" x2="-5.1" y2="5.1" width="0.1016" layer="51"/>
<wire x1="-5.1" y1="1" x2="-5.1" y2="5.1" width="0.2032" layer="21"/>
<wire x1="-5.1" y1="5.1" x2="2.8" y2="5.1" width="0.2032" layer="21"/>
<wire x1="2.8" y1="5.1" x2="5.1" y2="2.8" width="0.2032" layer="21"/>
<wire x1="5.1" y1="2.8" x2="5.1" y2="1" width="0.2032" layer="21"/>
<wire x1="5.1" y1="-1" x2="5.1" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="5.1" y1="-2.8" x2="2.8" y2="-5.1" width="0.2032" layer="21"/>
<wire x1="2.8" y1="-5.1" x2="-5.1" y2="-5.1" width="0.2032" layer="21"/>
<wire x1="-5.1" y1="-5.1" x2="-5.1" y2="-1" width="0.2032" layer="21"/>
<wire x1="-4.85" y1="-1" x2="4.85" y2="-1" width="0.2032" layer="21" curve="156.699401" cap="flat"/>
<wire x1="-4.85" y1="1" x2="4.85" y2="1" width="0.2032" layer="21" curve="-156.699401" cap="flat"/>
<wire x1="-3.25" y1="3.7" x2="-3.25" y2="-3.65" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="4.95" width="0.1016" layer="51"/>
<smd name="-" x="-4.25" y="0" dx="3.9" dy="1.6" layer="1"/>
<smd name="+" x="4.25" y="0" dx="3.9" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-5.85" y1="-0.45" x2="-4.9" y2="0.45" layer="51"/>
<rectangle x1="4.9" y1="-0.45" x2="5.85" y2="0.45" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-3.3" y="3.6"/>
<vertex x="-4.05" y="2.75"/>
<vertex x="-4.65" y="1.55"/>
<vertex x="-4.85" y="0.45"/>
<vertex x="-4.85" y="-0.45"/>
<vertex x="-4.65" y="-1.55"/>
<vertex x="-4.05" y="-2.75"/>
<vertex x="-3.3" y="-3.6"/>
<vertex x="-3.3" y="3.55"/>
</polygon>
</package>
<package name="PANASONIC_E">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package E&lt;/b&gt;</description>
<wire x1="-4.1" y1="4.1" x2="1.8" y2="4.1" width="0.1016" layer="51"/>
<wire x1="1.8" y1="4.1" x2="4.1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="4.1" y1="1.8" x2="4.1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="4.1" y1="-1.8" x2="1.8" y2="-4.1" width="0.1016" layer="51"/>
<wire x1="1.8" y1="-4.1" x2="-4.1" y2="-4.1" width="0.1016" layer="51"/>
<wire x1="-4.1" y1="-4.1" x2="-4.1" y2="4.1" width="0.1016" layer="51"/>
<wire x1="-4.1" y1="0.9" x2="-4.1" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-4.1" y1="4.1" x2="1.8" y2="4.1" width="0.2032" layer="21"/>
<wire x1="1.8" y1="4.1" x2="4.1" y2="1.8" width="0.2032" layer="21"/>
<wire x1="4.1" y1="1.8" x2="4.1" y2="0.9" width="0.2032" layer="21"/>
<wire x1="4.1" y1="-0.9" x2="4.1" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="4.1" y1="-1.8" x2="1.8" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="1.8" y1="-4.1" x2="-4.1" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="-4.1" y1="-4.1" x2="-4.1" y2="-0.9" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="3.25" x2="-2.2" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="-3.85" y1="0.9" x2="3.85" y2="0.9" width="0.2032" layer="21" curve="-153.684915" cap="flat"/>
<wire x1="-3.85" y1="-0.9" x2="3.85" y2="-0.9" width="0.2032" layer="21" curve="153.684915" cap="flat"/>
<circle x="0" y="0" radius="3.95" width="0.1016" layer="51"/>
<smd name="-" x="-3" y="0" dx="3.8" dy="1.4" layer="1"/>
<smd name="+" x="3" y="0" dx="3.8" dy="1.4" layer="1"/>
<text x="-1.27" y="1.27" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-4.5" y1="-0.35" x2="-3.8" y2="0.35" layer="51"/>
<rectangle x1="3.8" y1="-0.35" x2="4.5" y2="0.35" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-2.25" y="3.2"/>
<vertex x="-3" y="2.5"/>
<vertex x="-3.6" y="1.5"/>
<vertex x="-3.85" y="0.65"/>
<vertex x="-3.85" y="-0.65"/>
<vertex x="-3.55" y="-1.6"/>
<vertex x="-2.95" y="-2.55"/>
<vertex x="-2.25" y="-3.2"/>
<vertex x="-2.25" y="3.15"/>
</polygon>
</package>
<package name="PANASONIC_C">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package E&lt;/b&gt;</description>
<wire x1="-2.6" y1="2.45" x2="1.6" y2="2.45" width="0.2032" layer="21"/>
<wire x1="1.6" y1="2.45" x2="2.7" y2="1.35" width="0.2032" layer="21"/>
<wire x1="2.7" y1="-1.75" x2="1.6" y2="-2.85" width="0.2032" layer="21"/>
<wire x1="1.6" y1="-2.85" x2="-2.6" y2="-2.85" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="2.45" x2="1.6" y2="2.45" width="0.1016" layer="51"/>
<wire x1="1.6" y1="2.45" x2="2.7" y2="1.35" width="0.1016" layer="51"/>
<wire x1="2.7" y1="-1.75" x2="1.6" y2="-2.85" width="0.1016" layer="51"/>
<wire x1="1.6" y1="-2.85" x2="-2.6" y2="-2.85" width="0.1016" layer="51"/>
<wire x1="-2.6" y1="2.45" x2="-2.6" y2="0.35" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="-2.85" x2="-2.6" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="2.7" y1="1.35" x2="2.7" y2="0.35" width="0.2032" layer="21"/>
<wire x1="2.7" y1="-1.75" x2="2.7" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-2.6" y1="2.45" x2="-2.6" y2="-2.85" width="0.1016" layer="51"/>
<wire x1="2.7" y1="1.35" x2="2.7" y2="-1.75" width="0.1016" layer="51"/>
<wire x1="-2.4" y1="0.35" x2="2.45" y2="0.3" width="0.2032" layer="21" curve="-156.699401"/>
<wire x1="2.5" y1="-0.7" x2="-2.4" y2="-0.75" width="0.2032" layer="21" curve="-154.694887"/>
<circle x="0.05" y="-0.2" radius="2.5004" width="0.1016" layer="51"/>
<smd name="-" x="-1.8" y="-0.2" dx="2.2" dy="0.65" layer="1"/>
<smd name="+" x="1.9" y="-0.2" dx="2.2" dy="0.65" layer="1"/>
<text x="-2.6" y="2.7" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2.6" y="-3.45" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="NIPPON_F80">
<wire x1="-3.3" y1="3.3" x2="1.7" y2="3.3" width="0.2032" layer="21"/>
<wire x1="1.7" y1="3.3" x2="3.3" y2="2" width="0.2032" layer="21"/>
<wire x1="3.3" y1="-2" x2="1.7" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="1.7" y1="-3.3" x2="-3.3" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="3.3" x2="1.7" y2="3.3" width="0.1016" layer="51"/>
<wire x1="1.7" y1="3.3" x2="3.3" y2="2" width="0.1016" layer="51"/>
<wire x1="3.3" y1="-2" x2="1.7" y2="-3.3" width="0.1016" layer="51"/>
<wire x1="1.7" y1="-3.3" x2="-3.3" y2="-3.3" width="0.1016" layer="51"/>
<wire x1="-3.3" y1="3.3" x2="-3.3" y2="0.685" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="-3.3" x2="-3.3" y2="-0.685" width="0.2032" layer="21"/>
<wire x1="3.3" y1="2" x2="3.3" y2="0.685" width="0.2032" layer="21"/>
<wire x1="3.3" y1="-2" x2="3.3" y2="-0.685" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="3.3" x2="-3.3" y2="-3.3" width="0.1016" layer="51"/>
<wire x1="3.3" y1="2" x2="3.3" y2="-2" width="0.1016" layer="51"/>
<wire x1="-3.1" y1="0.685" x2="3.1" y2="0.685" width="0.2032" layer="21" curve="-156.500033"/>
<wire x1="3.1" y1="-0.685" x2="-3.1" y2="-0.685" width="0.2032" layer="21" curve="-154.748326"/>
<circle x="0" y="0" radius="3.15" width="0.1016" layer="51"/>
<smd name="-" x="-2.4" y="0" dx="2.95" dy="1" layer="1"/>
<smd name="+" x="2.4" y="0" dx="2.95" dy="1" layer="1"/>
<text x="-3.2" y="3.5" size="0.4064" layer="25">&gt;NAME</text>
<text x="-3.2" y="-3.85" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="PANASONIC_D">
<wire x1="-3.25" y1="3.25" x2="1.55" y2="3.25" width="0.1016" layer="51"/>
<wire x1="1.55" y1="3.25" x2="3.25" y2="1.55" width="0.1016" layer="51"/>
<wire x1="3.25" y1="1.55" x2="3.25" y2="-1.55" width="0.1016" layer="51"/>
<wire x1="3.25" y1="-1.55" x2="1.55" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="1.55" y1="-3.25" x2="-3.25" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="-3.25" y1="-3.25" x2="-3.25" y2="3.25" width="0.1016" layer="51"/>
<wire x1="-3.25" y1="0.95" x2="-3.25" y2="3.25" width="0.1016" layer="21"/>
<wire x1="-3.25" y1="3.25" x2="1.55" y2="3.25" width="0.1016" layer="21"/>
<wire x1="1.55" y1="3.25" x2="3.25" y2="1.55" width="0.1016" layer="21"/>
<wire x1="3.25" y1="1.55" x2="3.25" y2="0.95" width="0.1016" layer="21"/>
<wire x1="3.25" y1="-0.95" x2="3.25" y2="-1.55" width="0.1016" layer="21"/>
<wire x1="3.25" y1="-1.55" x2="1.55" y2="-3.25" width="0.1016" layer="21"/>
<wire x1="1.55" y1="-3.25" x2="-3.25" y2="-3.25" width="0.1016" layer="21"/>
<wire x1="-3.25" y1="-3.25" x2="-3.25" y2="-0.95" width="0.1016" layer="21"/>
<wire x1="2.95" y1="0.95" x2="-2.95" y2="0.95" width="0.1016" layer="21" curve="144.299363"/>
<wire x1="-2.95" y1="-0.95" x2="2.95" y2="-0.95" width="0.1016" layer="21" curve="144.299363"/>
<wire x1="-2.1" y1="2.25" x2="-2.1" y2="-2.2" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="3.1" width="0.1016" layer="51"/>
<smd name="+" x="2.4" y="0" dx="3" dy="1.4" layer="1"/>
<smd name="-" x="-2.4" y="0" dx="3" dy="1.4" layer="1"/>
<text x="-1.75" y="1" size="1.016" layer="25">&gt;NAME</text>
<text x="-1.75" y="-1.975" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-3.65" y1="-0.35" x2="-3.05" y2="0.35" layer="51"/>
<rectangle x1="3.05" y1="-0.35" x2="3.65" y2="0.35" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-2.15" y="2.15"/>
<vertex x="-2.6" y="1.6"/>
<vertex x="-2.9" y="0.9"/>
<vertex x="-3.05" y="0"/>
<vertex x="-2.9" y="-0.95"/>
<vertex x="-2.55" y="-1.65"/>
<vertex x="-2.15" y="-2.15"/>
<vertex x="-2.15" y="2.1"/>
</polygon>
</package>
<package name="CPOL-RADIAL-1000UF-63V">
<wire x1="-3.175" y1="1.905" x2="-4.445" y2="1.905" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="8.001" width="0.2032" layer="21"/>
<pad name="2" x="-3.81" y="0" drill="1.016" diameter="1.6764"/>
<pad name="1" x="3.81" y="0" drill="1.016" diameter="1.651" shape="square"/>
<text x="-2.54" y="8.89" size="0.8128" layer="27">&gt;Value</text>
<text x="-2.54" y="10.16" size="0.8128" layer="25">&gt;Name</text>
</package>
<package name="CPOL-RADIAL-1000UF-25V">
<wire x1="-1.905" y1="1.27" x2="-3.175" y2="1.27" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="5.461" width="0.2032" layer="21"/>
<pad name="2" x="-2.54" y="0" drill="0.7" diameter="1.651"/>
<pad name="1" x="2.54" y="0" drill="0.7" diameter="1.651" shape="square"/>
<text x="-1.905" y="-4.318" size="0.8128" layer="27">&gt;Value</text>
<text x="-0.762" y="2.921" size="0.4064" layer="25">&gt;Name</text>
</package>
<package name="VISHAY_C">
<wire x1="0" y1="1.27" x2="0" y2="1.905" width="0.254" layer="21"/>
<wire x1="-2.0574" y1="4.2926" x2="-2.0574" y2="-4.2926" width="0.127" layer="21"/>
<wire x1="-2.0574" y1="-4.2926" x2="2.0574" y2="-4.2926" width="0.127" layer="21"/>
<wire x1="2.0574" y1="-4.2926" x2="2.0574" y2="4.2926" width="0.127" layer="21"/>
<wire x1="2.0574" y1="4.2926" x2="-2.0574" y2="4.2926" width="0.127" layer="21"/>
<smd name="+" x="0" y="3.048" dx="3.556" dy="1.778" layer="1"/>
<smd name="-" x="0" y="-3.048" dx="3.556" dy="1.778" layer="1"/>
<text x="-1.905" y="4.445" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.905" y="-5.08" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="PANASONIC_H13">
<wire x1="-6.75" y1="6.75" x2="4" y2="6.75" width="0.1016" layer="51"/>
<wire x1="4" y1="6.75" x2="6.75" y2="4" width="0.1016" layer="51"/>
<wire x1="6.75" y1="4" x2="6.75" y2="-4" width="0.1016" layer="51"/>
<wire x1="6.75" y1="-4" x2="4" y2="-6.75" width="0.1016" layer="51"/>
<wire x1="4" y1="-6.75" x2="-6.75" y2="-6.75" width="0.1016" layer="51"/>
<wire x1="-6.75" y1="-6.75" x2="-6.75" y2="6.75" width="0.1016" layer="51"/>
<wire x1="-6.75" y1="1" x2="-6.75" y2="6.75" width="0.2032" layer="21"/>
<wire x1="-6.75" y1="6.75" x2="4" y2="6.75" width="0.2032" layer="21"/>
<wire x1="4" y1="6.75" x2="6.75" y2="4" width="0.2032" layer="21"/>
<wire x1="6.75" y1="4" x2="6.75" y2="1" width="0.2032" layer="21"/>
<wire x1="6.75" y1="-1" x2="6.75" y2="-4" width="0.2032" layer="21"/>
<wire x1="6.75" y1="-4" x2="4" y2="-6.75" width="0.2032" layer="21"/>
<wire x1="4" y1="-6.75" x2="-6.75" y2="-6.75" width="0.2032" layer="21"/>
<wire x1="-6.75" y1="-6.75" x2="-6.75" y2="-1" width="0.2032" layer="21"/>
<wire x1="-6.55" y1="-1.2" x2="6.45" y2="-1.2" width="0.2032" layer="21" curve="156.692742" cap="flat"/>
<wire x1="-6.55" y1="1.2" x2="6.55" y2="1.2" width="0.2032" layer="21" curve="-156.697982" cap="flat"/>
<wire x1="-5" y1="4.25" x2="-4.95" y2="-4.35" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="6.6" width="0.1016" layer="51"/>
<smd name="-" x="-4.7" y="0" dx="5" dy="1.6" layer="1"/>
<smd name="+" x="4.7" y="0" dx="5" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-7.55" y1="-0.45" x2="-6.6" y2="0.45" layer="51"/>
<rectangle x1="6.6" y1="-0.45" x2="7.55" y2="0.45" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-5" y="4.2"/>
<vertex x="-5.75" y="3.15"/>
<vertex x="-6.25" y="2.05"/>
<vertex x="-6.55" y="0.45"/>
<vertex x="-6.55" y="-0.45"/>
<vertex x="-6.35" y="-1.65"/>
<vertex x="-5.75" y="-3.25"/>
<vertex x="-5" y="-4.2"/>
</polygon>
</package>
<package name="EIA6032">
<wire x1="3.2" y1="-1.6" x2="3.2" y2="1.6" width="0.127" layer="21"/>
<wire x1="-2.8" y1="-1.6" x2="3.2" y2="-1.6" width="0.127" layer="21"/>
<wire x1="3.2" y1="1.6" x2="-2.8" y2="1.6" width="0.127" layer="21"/>
<wire x1="-2.8" y1="1.6" x2="-3.4" y2="1" width="0.127" layer="21"/>
<wire x1="-3.4" y1="1" x2="-3.4" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.8" y1="-1.6" x2="-3.4" y2="-1" width="0.127" layer="21"/>
<smd name="P$1" x="-2.3" y="0" dx="1.5" dy="2.4" layer="1"/>
<smd name="P$2" x="2.3" y="0" dx="1.5" dy="2.4" layer="1"/>
</package>
<package name="EN_J2">
<description>Type J2 package for SMD supercap PRT-10317 (p# EEC-EN0F204J2)</description>
<wire x1="-2.5" y1="-3.5" x2="2.5" y2="-3.5" width="0.127" layer="51"/>
<wire x1="-2.1" y1="3.5" x2="2.1" y2="3.5" width="0.127" layer="51"/>
<wire x1="-2.1" y1="3.5" x2="-2.5" y2="3.1" width="0.127" layer="51"/>
<wire x1="-2.5" y1="3.1" x2="-2.5" y2="2.3" width="0.127" layer="51"/>
<wire x1="2.1" y1="3.5" x2="2.5" y2="3.1" width="0.127" layer="51"/>
<wire x1="2.5" y1="3.1" x2="2.5" y2="2.3" width="0.127" layer="51"/>
<wire x1="-2.5" y1="-3.5" x2="-2.5" y2="-2.3" width="0.127" layer="51"/>
<wire x1="2.5" y1="-3.5" x2="2.5" y2="-2.3" width="0.127" layer="51"/>
<wire x1="-2.5908" y1="-2.413" x2="-2.5654" y2="2.4384" width="0.127" layer="21" curve="-91.212564"/>
<wire x1="2.5908" y1="-2.413" x2="2.5654" y2="2.4384" width="0.127" layer="21" curve="86.79344"/>
<wire x1="1.7272" y1="-1.27" x2="1.7272" y2="-2.0828" width="0.127" layer="21"/>
<wire x1="1.3462" y1="-1.6764" x2="2.159" y2="-1.6764" width="0.127" layer="21"/>
<circle x="0" y="0" radius="3.4" width="0.127" layer="51"/>
<smd name="-" x="0" y="2.8" dx="5" dy="2.4" layer="1"/>
<smd name="+" x="0" y="-3.2" dx="5" dy="1.6" layer="1"/>
<text x="-2.28" y="0.66" size="0.4064" layer="25">&gt;NAME</text>
<text x="-2.31" y="-1.21" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="EIA3528-KIT">
<description>&lt;h3&gt;EIA3528-KIT&lt;/h3&gt;
&lt;b&gt;Warning:&lt;/b&gt; This is the KIT version of this package. This package has longer pads to make hand soldering easier.&lt;br&gt;</description>
<wire x1="-0.9" y1="-1.6" x2="-3.1" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-3.1" y1="-1.6" x2="-3.1" y2="1.55" width="0.2032" layer="21"/>
<wire x1="-3.1" y1="1.55" x2="-0.9" y2="1.55" width="0.2032" layer="21"/>
<wire x1="1" y1="-1.55" x2="2.7" y2="-1.55" width="0.2032" layer="21"/>
<wire x1="2.7" y1="-1.55" x2="3.1" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="3.1" y1="-1.2" x2="3.1" y2="1.25" width="0.2032" layer="21"/>
<wire x1="3.1" y1="1.25" x2="2.7" y2="1.55" width="0.2032" layer="21"/>
<wire x1="2.7" y1="1.55" x2="1" y2="1.55" width="0.2032" layer="21"/>
<wire x1="0.609" y1="1.311" x2="0.609" y2="-1.286" width="0.4" layer="21" style="longdash"/>
<smd name="C" x="-1.9" y="0" dx="1.7" dy="2.5" layer="1"/>
<smd name="A" x="1.9" y="0" dx="1.7" dy="2.5" layer="1"/>
<text x="-2.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.24" y="-1.37" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="EIA3216-KIT">
<description>&lt;h3&gt;EIA3216-KIT&lt;/h3&gt;
&lt;b&gt;Warning:&lt;/b&gt; This is the KIT version of this package. This package has longer pads to make hand soldering easier.&lt;br&gt;</description>
<wire x1="-1" y1="-1.2" x2="-3" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-3" y1="-1.2" x2="-3" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-3" y1="1.2" x2="-1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="1" y1="-1.2" x2="2.6" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="2.6" y1="-1.2" x2="3" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="3" y1="-0.8" x2="3" y2="0.8" width="0.2032" layer="21"/>
<wire x1="3" y1="0.8" x2="2.6" y2="1.2" width="0.2032" layer="21"/>
<wire x1="2.6" y1="1.2" x2="1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.381" y2="-1.016" width="0.127" layer="21"/>
<smd name="C" x="-1.65" y="0" dx="1.9" dy="1.6" layer="1"/>
<smd name="A" x="1.65" y="0" dx="1.9" dy="1.6" layer="1"/>
<text x="-2.54" y="1.381" size="0.4064" layer="25">&gt;NAME</text>
<text x="0.408" y="1.332" size="0.4064" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.1524" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.1524" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0.381" y2="1.016" width="0.1524" layer="94"/>
<wire x1="0.381" y1="1.016" x2="1.016" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="1.016" y1="-1.016" x2="1.651" y2="1.016" width="0.1524" layer="94"/>
<wire x1="1.651" y1="1.016" x2="2.286" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="0" width="0.1524" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="CAP">
<wire x1="0" y1="2.54" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="0.508" width="0.1524" layer="94"/>
<text x="1.524" y="2.921" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-2.159" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="0.508" x2="2.032" y2="1.016" layer="94"/>
<rectangle x1="-2.032" y1="1.524" x2="2.032" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="INDUCTOR">
<wire x1="0" y1="5.08" x2="1.27" y2="3.81" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="2.54" x2="1.27" y2="3.81" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-1.27" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-3.81" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="-5.08" x2="1.27" y2="-3.81" width="0.254" layer="94" curve="90" cap="flat"/>
<text x="2.54" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="7.62" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-7.62" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="CAP_POL">
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-1.016" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-1" x2="2.4892" y2="-1.8542" width="0.254" layer="94" curve="-37.878202" cap="flat"/>
<wire x1="-2.4669" y1="-1.8504" x2="0" y2="-1.0161" width="0.254" layer="94" curve="-37.376341" cap="flat"/>
<text x="1.016" y="0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.016" y="-4.191" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.253" y1="0.668" x2="-1.364" y2="0.795" layer="94"/>
<rectangle x1="-1.872" y1="0.287" x2="-1.745" y2="1.176" layer="94"/>
<pin name="+" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="-" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<description>&lt;b&gt;Resistor&lt;/b&gt;
Basic schematic elements and footprints for 0603, 1206, and PTH resistors.</description>
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="AXIAL-0.3" package="AXIAL-0.3">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2010" package="R2010">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-RES" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603-RES" package="0603-RES">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402-RES" package="0402-RES">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH-1/6W" package="1/6W-RES">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2512" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH-1/4W" package="AXIAL-0.4">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH-1/2W" package="AXIAL-0.5">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH-1W" package="AXIAL-0.6">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH-2W" package="AXIAL-0.8">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="KIT" package="AXIAL-0.3-KIT">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EZ" package="AXIAL-0.3EZ">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP" prefix="C" uservalue="yes">
<description>&lt;b&gt;Capacitor&lt;/b&gt;
Standard 0603 ceramic capacitor, and 0.1" leaded capacitor.</description>
<gates>
<gate name="G$1" symbol="CAP" x="0" y="0"/>
</gates>
<devices>
<device name="PTH" package="CAP-PTH-SMALL">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH2" package="CAP-PTH-SMALL2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH3" package="CAP-PTH-LARGE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD" package="GRM43D">
<connects>
<connect gate="G$1" pin="1" pad="A"/>
<connect gate="G$1" pin="2" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603-CAP" package="0603-CAP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402-CAP" package="0402-CAP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH1" package="CAP-PTH-5MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_" package="AXIAL-5MM">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1210" package="1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ASMD" package="CTZ3">
<connects>
<connect gate="G$1" pin="1" pad="+"/>
<connect gate="G$1" pin="2" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="KIT" package="CAP-PTH-SMALL-KIT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EZ" package="CAP-PTH-SMALLEZ">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="INDUCTOR" prefix="L" uservalue="yes">
<description>&lt;b&gt;Inductors&lt;/b&gt;&lt;p&gt;
Basic Inductor/Choke - 0603 and 1206. Footprints are not proven and vary greatly between part numbers.&lt;br&gt;
INDUCTOR POWER 3.3UH 4.0A SMD&lt;br&gt;
0.197" L x 0.197" W x 0.177" H (5.00mm x 5.00mm x 4.50mm)</description>
<gates>
<gate name="G$1" symbol="INDUCTOR" x="0" y="0"/>
</gates>
<devices>
<device name="H*" package="INDUCTOR-1206">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="1206"/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CR54" package="CR54">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PWR" package="CDRH125">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-B82462G" package="B82462G">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="68UH-1A" package="CR75">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-09739"/>
<attribute name="VALUE" value="68uH"/>
</technology>
</technologies>
</device>
<device name="1210" package="1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1007" package="1007">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_" package="COOPER_UP4B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-" package="CDRH3D28">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CR75_V2" package="CR75_V2">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="." package="CDRH2D09">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NPI75" package="NPI75C">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SRU5028" package="SRU5028">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SRU1038" package="SRU1038">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CR54-KIT" package="CR54-KIT">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DR1030" package="DR1030">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VLF4012A" package="VLF4012A">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="AXIAL-0.6" package="AXIAL-0.6">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RLB0912" package="RLB0912">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="BOURNS_SRN6045" package="SRN6045">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-11627"/>
<attribute name="VALUE" value="33uH"/>
</technology>
</technologies>
</device>
<device name="SDR0403-560KL" package="SDR0403">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DIST" value="DIGIKEY"/>
<attribute name="DIST_ID" value="SDR0403-560KLCT-ND"/>
<attribute name="VALUE" value="56uH"/>
</technology>
</technologies>
</device>
<device name="30OHM,1.8A" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="RES-07859"/>
</technology>
</technologies>
</device>
<device name="" package="INDUCTOR-SRP4020">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="INDUCTOR_4.7UH" package="INDUCTOR_4.7UH">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-10146"/>
</technology>
</technologies>
</device>
<device name="SDR13-7-270ML" package="INDUCTOR_SDR1307">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-12529" constant="no"/>
<attribute name="VALUE" value="27uH" constant="no"/>
</technology>
</technologies>
</device>
<device name="CR54-3.3UH" package="CR54">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-11157" constant="no"/>
<attribute name="VALUE" value="3.3uH" constant="no"/>
</technology>
</technologies>
</device>
<device name="CR54-47UH" package="CR54">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="NDUC-10789" constant="no"/>
<attribute name="VALUE" value="47uH" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP_POL" prefix="C" uservalue="yes">
<description>&lt;b&gt;Capacitor Polarized&lt;/b&gt;
These are standard SMD and PTH capacitors. Normally 10uF, 47uF, and 100uF in electrolytic and tantalum varieties. Always verify the external diameter of the through hole cap, it varies with capacity, voltage, and manufacturer. The EIA devices should be standard.</description>
<gates>
<gate name="G$1" symbol="CAP_POL" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="EIA3216">
<connects>
<connect gate="G$1" pin="+" pad="A"/>
<connect gate="G$1" pin="-" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3528" package="EIA3528">
<connects>
<connect gate="G$1" pin="+" pad="A"/>
<connect gate="G$1" pin="-" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH1" package="CPOL-RADIAL-100UF-25V">
<connects>
<connect gate="G$1" pin="+" pad="1"/>
<connect gate="G$1" pin="-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH2" package="CPOL-RADIAL-10UF-25V">
<connects>
<connect gate="G$1" pin="+" pad="1"/>
<connect gate="G$1" pin="-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="7343" package="EIA7343">
<connects>
<connect gate="G$1" pin="+" pad="A"/>
<connect gate="G$1" pin="-" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="G" package="PANASONIC_G">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="E" package="PANASONIC_E">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C" package="PANASONIC_C">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="F80" package="NIPPON_F80">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D" package="PANASONIC_D">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH3" package="CPOL-RADIAL-1000UF-63V">
<connects>
<connect gate="G$1" pin="+" pad="1"/>
<connect gate="G$1" pin="-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH4" package="CPOL-RADIAL-1000UF-25V">
<connects>
<connect gate="G$1" pin="+" pad="1"/>
<connect gate="G$1" pin="-" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD" package="VISHAY_C">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="H13" package="PANASONIC_H13">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="6032" package="EIA6032">
<connects>
<connect gate="G$1" pin="+" pad="P$1"/>
<connect gate="G$1" pin="-" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EN_J2" package="EN_J2">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3528-KIT" package="EIA3528-KIT">
<connects>
<connect gate="G$1" pin="+" pad="A"/>
<connect gate="G$1" pin="-" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206-KIT" package="EIA3216-KIT">
<connects>
<connect gate="G$1" pin="+" pad="A"/>
<connect gate="G$1" pin="-" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-Aesthetics">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
In this library you'll find non-functional items- supply symbols, logos, notations, frame blocks, etc.&lt;br&gt;&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is the end user's responsibility to ensure correctness and suitablity for a given componet or application. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
</packages>
<symbols>
<symbol name="DGND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VCCA">
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<text x="-1.016" y="3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCCA" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="DGND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCCA">
<gates>
<gate name="G$1" symbol="VCCA" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="W5500">
<packages>
<package name="W5500">
<smd name="1" x="-4.45" y="2.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="2" x="-4.45" y="2.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="3" x="-4.45" y="1.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="4" x="-4.45" y="1.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="5" x="-4.45" y="0.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="6" x="-4.45" y="0.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="7" x="-4.45" y="-0.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="8" x="-4.45" y="-0.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="9" x="-4.45" y="-1.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="10" x="-4.45" y="-1.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="11" x="-4.45" y="-2.25" dx="1.5" dy="0.3" layer="1"/>
<smd name="12" x="-4.45" y="-2.75" dx="1.5" dy="0.3" layer="1"/>
<smd name="13" x="-2.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="14" x="-2.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="15" x="-1.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="16" x="-1.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="17" x="-0.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="18" x="-0.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="19" x="0.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="20" x="0.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="21" x="1.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="22" x="1.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="23" x="2.25" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="24" x="2.75" y="-4.45" dx="1.5" dy="0.3" layer="1" rot="R90"/>
<smd name="25" x="4.45" y="-2.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="26" x="4.45" y="-2.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="27" x="4.45" y="-1.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="28" x="4.45" y="-1.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="29" x="4.45" y="-0.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="30" x="4.45" y="-0.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="31" x="4.45" y="0.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="32" x="4.45" y="0.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="33" x="4.45" y="1.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="34" x="4.45" y="1.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="35" x="4.45" y="2.25" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="36" x="4.45" y="2.75" dx="1.5" dy="0.3" layer="1" rot="R180"/>
<smd name="37" x="2.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="38" x="2.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="39" x="1.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="40" x="1.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="41" x="0.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="42" x="0.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="43" x="-0.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="44" x="-0.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="45" x="-1.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="46" x="-1.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="47" x="-2.25" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<smd name="48" x="-2.75" y="4.45" dx="1.5" dy="0.3" layer="1" rot="R270"/>
<wire x1="-3.5" y1="3.5" x2="-3.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="-3.5" y1="-3.5" x2="3.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3.5" x2="3.5" y2="3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="3.5" x2="-3.5" y2="3.5" width="0.127" layer="21"/>
<circle x="-2.54" y="2.54" radius="0.3" width="0.127" layer="21"/>
<text x="-1.27" y="0" size="0.6096" layer="25" font="vector">&gt;Name</text>
<text x="-4.445" y="3.175" size="0.6096" layer="27" font="vector">1</text>
<wire x1="-5.5" y1="-1.75" x2="-6" y2="-1.75" width="0.127" layer="27"/>
<wire x1="-5.5" y1="0.75" x2="-5.75" y2="0.75" width="0.127" layer="27"/>
<wire x1="-1.75" y1="-5.5" x2="-1.75" y2="-5.75" width="0.127" layer="27"/>
<wire x1="0.75" y1="-5.5" x2="0.75" y2="-6" width="0.127" layer="27"/>
<wire x1="5.5" y1="-2.75" x2="5.75" y2="-2.75" width="0.127" layer="27"/>
<wire x1="5.5" y1="-0.25" x2="6" y2="-0.25" width="0.127" layer="27"/>
<wire x1="5.5" y1="2.25" x2="5.75" y2="2.25" width="0.127" layer="27"/>
<wire x1="1.25" y1="5.5" x2="1.25" y2="6" width="0.127" layer="27"/>
<wire x1="-1.25" y1="5.5" x2="-1.25" y2="5.75" width="0.127" layer="27"/>
<text x="-4.445" y="-4.445" size="0.6096" layer="27" font="vector">13</text>
<text x="3.81" y="-3.81" size="0.6096" layer="27" font="vector">25</text>
<text x="3.175" y="3.81" size="0.6096" layer="27" font="vector">37</text>
</package>
</packages>
<symbols>
<symbol name="W5500">
<pin name="TXN" x="-30.48" y="12.7" length="short" direction="pas"/>
<pin name="TXP" x="-30.48" y="10.16" length="short" direction="pas"/>
<pin name="AGND@1" x="-30.48" y="7.62" length="short" direction="pas"/>
<pin name="AVDD@1" x="-30.48" y="5.08" length="short" direction="pas"/>
<pin name="RXN" x="-30.48" y="2.54" length="short" direction="pas"/>
<pin name="RXP" x="-30.48" y="0" length="short" direction="pas"/>
<pin name="DNC" x="-30.48" y="-2.54" length="short" direction="pas"/>
<pin name="AVDD@2" x="-30.48" y="-5.08" length="short" direction="pas"/>
<pin name="AGND@2" x="-30.48" y="-7.62" length="short" direction="pas"/>
<pin name="EXRES1" x="-30.48" y="-10.16" length="short" direction="pas"/>
<pin name="AVDD@3" x="-30.48" y="-12.7" length="short" direction="pas"/>
<pin name="NC@1" x="-30.48" y="-15.24" length="short" direction="pas"/>
<pin name="NC@2" x="-15.24" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AGND@3" x="-12.7" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AVDD@4" x="-10.16" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AGND@4" x="-7.62" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AVDD@5" x="-5.08" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="VBG" x="-2.54" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AGND@5" x="0" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="TOCAP" x="2.54" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="AVDD@6" x="5.08" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="1V2O" x="7.62" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="RSVD@1" x="10.16" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="SPDLED" x="12.7" y="-30.48" length="short" direction="pas" rot="R90"/>
<pin name="LINKLED" x="27.94" y="-15.24" length="short" direction="pas" rot="R180"/>
<pin name="DUPLED" x="27.94" y="-12.7" length="short" direction="pas" rot="R180"/>
<pin name="ACTLED" x="27.94" y="-10.16" length="short" direction="pas" rot="R180"/>
<pin name="VDD" x="27.94" y="-7.62" length="short" direction="pas" rot="R180"/>
<pin name="GND" x="27.94" y="-5.08" length="short" direction="pas" rot="R180"/>
<pin name="XI/CLKIN" x="27.94" y="-2.54" length="short" direction="pas" rot="R180"/>
<pin name="XO" x="27.94" y="0" length="short" direction="pas" rot="R180"/>
<pin name="SCS_N" x="27.94" y="2.54" length="short" direction="pas" rot="R180"/>
<pin name="SCLK" x="27.94" y="5.08" length="short" direction="pas" rot="R180"/>
<pin name="MISO" x="27.94" y="7.62" length="short" direction="pas" rot="R180"/>
<pin name="MOSI" x="27.94" y="10.16" length="short" direction="pas" rot="R180"/>
<pin name="INT_N" x="27.94" y="12.7" length="short" direction="pas" rot="R180"/>
<pin name="RST_N" x="12.7" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="RSVD@2" x="10.16" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="RSVD@3" x="7.62" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="RSVD@4" x="5.08" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="RSVD@5" x="2.54" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="RSVD@6" x="0" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="PMODE2" x="-2.54" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="PMODE1" x="-5.08" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="PMODE0" x="-7.62" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="NC@3" x="-10.16" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="NC@4" x="-12.7" y="27.94" length="short" direction="pas" rot="R270"/>
<pin name="AGND@6" x="-15.24" y="27.94" length="short" direction="pas" rot="R270"/>
<wire x1="-27.94" y1="25.4" x2="-27.94" y2="-27.94" width="0.254" layer="94"/>
<wire x1="-27.94" y1="-27.94" x2="25.4" y2="-27.94" width="0.254" layer="94"/>
<wire x1="25.4" y1="-27.94" x2="25.4" y2="25.4" width="0.254" layer="94"/>
<wire x1="25.4" y1="25.4" x2="-27.94" y2="25.4" width="0.254" layer="94"/>
<text x="-5.08" y="2.54" size="1.778" layer="95">&gt;Name</text>
<text x="-5.08" y="0" size="1.778" layer="96">&gt;Value</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="W5500" prefix="U">
<gates>
<gate name="G$1" symbol="W5500" x="-22.86" y="12.7"/>
</gates>
<devices>
<device name="" package="W5500">
<connects>
<connect gate="G$1" pin="1V2O" pad="22"/>
<connect gate="G$1" pin="ACTLED" pad="27"/>
<connect gate="G$1" pin="AGND@1" pad="3"/>
<connect gate="G$1" pin="AGND@2" pad="9"/>
<connect gate="G$1" pin="AGND@3" pad="14"/>
<connect gate="G$1" pin="AGND@4" pad="16"/>
<connect gate="G$1" pin="AGND@5" pad="19"/>
<connect gate="G$1" pin="AGND@6" pad="48"/>
<connect gate="G$1" pin="AVDD@1" pad="4"/>
<connect gate="G$1" pin="AVDD@2" pad="8"/>
<connect gate="G$1" pin="AVDD@3" pad="11"/>
<connect gate="G$1" pin="AVDD@4" pad="15"/>
<connect gate="G$1" pin="AVDD@5" pad="17"/>
<connect gate="G$1" pin="AVDD@6" pad="21"/>
<connect gate="G$1" pin="DNC" pad="7"/>
<connect gate="G$1" pin="DUPLED" pad="26"/>
<connect gate="G$1" pin="EXRES1" pad="10"/>
<connect gate="G$1" pin="GND" pad="29"/>
<connect gate="G$1" pin="INT_N" pad="36"/>
<connect gate="G$1" pin="LINKLED" pad="25"/>
<connect gate="G$1" pin="MISO" pad="34"/>
<connect gate="G$1" pin="MOSI" pad="35"/>
<connect gate="G$1" pin="NC@1" pad="12"/>
<connect gate="G$1" pin="NC@2" pad="13"/>
<connect gate="G$1" pin="NC@3" pad="46"/>
<connect gate="G$1" pin="NC@4" pad="47"/>
<connect gate="G$1" pin="PMODE0" pad="45"/>
<connect gate="G$1" pin="PMODE1" pad="44"/>
<connect gate="G$1" pin="PMODE2" pad="43"/>
<connect gate="G$1" pin="RST_N" pad="37"/>
<connect gate="G$1" pin="RSVD@1" pad="23"/>
<connect gate="G$1" pin="RSVD@2" pad="38"/>
<connect gate="G$1" pin="RSVD@3" pad="39"/>
<connect gate="G$1" pin="RSVD@4" pad="40"/>
<connect gate="G$1" pin="RSVD@5" pad="41"/>
<connect gate="G$1" pin="RSVD@6" pad="42"/>
<connect gate="G$1" pin="RXN" pad="5"/>
<connect gate="G$1" pin="RXP" pad="6"/>
<connect gate="G$1" pin="SCLK" pad="33"/>
<connect gate="G$1" pin="SCS_N" pad="32"/>
<connect gate="G$1" pin="SPDLED" pad="24"/>
<connect gate="G$1" pin="TOCAP" pad="20"/>
<connect gate="G$1" pin="TXN" pad="1"/>
<connect gate="G$1" pin="TXP" pad="2"/>
<connect gate="G$1" pin="VBG" pad="18"/>
<connect gate="G$1" pin="VDD" pad="28"/>
<connect gate="G$1" pin="XI/CLKIN" pad="30"/>
<connect gate="G$1" pin="XO" pad="31"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" prefix="+3V3">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
We've spent an enormous amount of time creating and checking these footprints and parts. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; CC v3.0 Share-Alike You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="RESONATOR-SMD">
<wire x1="1.8" y1="0.65" x2="1.8" y2="-0.65" width="0.2032" layer="21"/>
<wire x1="-1.8" y1="-0.65" x2="-1.8" y2="0.65" width="0.2032" layer="21"/>
<wire x1="-1.6" y1="0.65" x2="1.6" y2="0.65" width="0.127" layer="51"/>
<wire x1="1.6" y1="0.65" x2="1.6" y2="-0.65" width="0.127" layer="51"/>
<wire x1="1.6" y1="-0.65" x2="-1.6" y2="-0.65" width="0.127" layer="51"/>
<wire x1="-1.6" y1="-0.65" x2="-1.6" y2="0.65" width="0.127" layer="51"/>
<smd name="1" x="-1.2" y="0" dx="0.7" dy="1.7" layer="1"/>
<smd name="2" x="0" y="0" dx="0.7" dy="1.7" layer="1"/>
<smd name="3" x="1.2" y="0" dx="0.7" dy="1.7" layer="1"/>
<text x="-0.889" y="1.27" size="0.4064" layer="25">&gt;Name</text>
<text x="-0.889" y="-1.524" size="0.4064" layer="27">&gt;Value</text>
</package>
<package name="RESONATOR-PTH">
<wire x1="-2.286" y1="1.778" x2="-2.286" y2="-1.778" width="0.2032" layer="21" curve="162.403081"/>
<wire x1="2.286" y1="-1.778" x2="2.286" y2="1.778" width="0.2032" layer="21" curve="162.403081"/>
<wire x1="-2.286" y1="-1.778" x2="2.286" y2="-1.778" width="0.2032" layer="21" curve="12.71932"/>
<wire x1="2.286" y1="1.778" x2="-2.286" y2="1.778" width="0.2032" layer="21" curve="12.758496"/>
<pad name="2" x="0" y="0" drill="0.8" diameter="1.8796"/>
<pad name="1" x="-2.54" y="0" drill="0.8" diameter="1.8796"/>
<pad name="3" x="2.54" y="0" drill="0.8" diameter="1.8796"/>
</package>
</packages>
<symbols>
<symbol name="RESONATOR">
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="1.524" width="0.1524" layer="94"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.016" y1="1.778" x2="1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="1.016" y1="0" x2="1.016" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0" x2="-1.016" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-2.032" x2="2.54" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.032" x2="1.778" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-3.048" x2="2.54" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-3.048" x2="1.778" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-3.048" x2="2.54" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-1.778" y1="-3.048" x2="-2.54" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-3.048" x2="-3.302" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-3.048" x2="-2.54" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-1.778" y1="-2.032" x2="-2.54" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.032" x2="-3.302" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.032" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="0" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="0" y1="-5.08" x2="0" y2="-7.62" width="0.1524" layer="94"/>
<text x="2.54" y="1.016" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
<pin name="2" x="0" y="-7.62" visible="off" length="point" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RESONATOR" prefix="Y">
<description>&lt;b&gt;Resonator&lt;/b&gt;
Small SMD resonator. This is the itty bitty 10/20MHz resonators with built in caps. CSTCE10M0G55 and CSTCE20M0V53. Footprint has been reviewed closely but hasn't been tested yet.</description>
<gates>
<gate name="G$1" symbol="RESONATOR" x="0" y="0"/>
</gates>
<devices>
<device name="SMD" package="RESONATOR-SMD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH" package="RESONATOR-PTH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-PowerSymbols">
<description>&lt;h3&gt;SparkFun Power Symbols&lt;/h3&gt;
This library contains power, ground, and voltage-supply symbols.
&lt;br&gt;
&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is &lt;b&gt; the end user's responsibility&lt;/b&gt; to ensure correctness and suitablity for a given componet or application. 
&lt;br&gt;
&lt;br&gt;If you enjoy using this library, please buy one of our products at &lt;a href=" www.sparkfun.com"&gt;SparkFun.com&lt;/a&gt;.
&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;
&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
</packages>
<symbols>
<symbol name="VCC-ISO">
<description>&lt;h3&gt;VCC Isolated Voltage Supply&lt;/h3&gt;</description>
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<pin name="VCC-ISO" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="1.524" y1="1.778" x2="1.524" y2="3.302" width="0.254" layer="94"/>
<text x="1.524" y="3.556" size="1.778" layer="96" align="bottom-center">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC-ISO">
<description>&lt;h3&gt;Isolated power supply&lt;/h3&gt;
&lt;p&gt;Generic symbol for an isolated power supply.&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="VCC-ISO" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="holes">
<description>&lt;b&gt;Mounting Holes and Pads&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2,8">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 2.8 mm with drill center</description>
<wire x1="-1.778" y1="0" x2="0" y2="-1.778" width="2.286" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.778" x2="1.778" y2="0" width="2.286" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.635" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="40"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="39"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="41"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="42"/>
<circle x="0" y="0" radius="2.54" width="2.032" layer="43"/>
<circle x="0" y="0" radius="1.5" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="2.8"/>
</package>
<package name="3,0">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.0 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.6" width="0.2032" layer="21"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,0</text>
<hole x="0" y="0" drill="3"/>
</package>
<package name="3,3">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.3 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.54" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.54" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.75" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.3"/>
</package>
<package name="3,6">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.6 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.7686" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.7686" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.9" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.6"/>
</package>
<package name="4,1">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.1 mm with drill center</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="39"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="40"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.15" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="4.1"/>
</package>
<package name="4,5">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.5 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="3.8184" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.35" width="0.1524" layer="21"/>
<text x="-1.27" y="-4.445" size="1.27" layer="48">4,5</text>
<hole x="0" y="0" drill="4.5"/>
</package>
<package name="5,0">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 5.0 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="43"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="42"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="41"/>
<circle x="0" y="0" radius="2.6" width="0.1524" layer="21"/>
<text x="-1.27" y="-4.445" size="1.27" layer="48">5,0</text>
<hole x="0" y="0" drill="5"/>
</package>
<package name="3,2">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 3.2 mm with drill center</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="39"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="43"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="40"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="41"/>
<circle x="0" y="0" radius="3.048" width="2.032" layer="42"/>
<circle x="0" y="0" radius="1.7" width="0.2032" layer="21"/>
<hole x="0" y="0" drill="3.2"/>
</package>
<package name="4,3">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 4.3 mm with drill center</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="3.8184" width="2.54" layer="41"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="42"/>
<circle x="0" y="0" radius="3.81" width="2.54" layer="43"/>
<circle x="0" y="0" radius="2.25" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="4.3"/>
</package>
<package name="5,5">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; 5.5 mm with drill center</description>
<wire x1="4.445" y1="0" x2="2.159" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="4.445" x2="0" y2="2.159" width="0.0508" layer="21"/>
<wire x1="-2.159" y1="0" x2="-4.445" y2="0" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.445" width="0.0508" layer="21"/>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="39"/>
<circle x="0" y="0" radius="4.699" width="4.5466" layer="40"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="43"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="42"/>
<circle x="0" y="0" radius="4.826" width="2.54" layer="41"/>
<circle x="0" y="0" radius="2.85" width="0.1524" layer="21"/>
<hole x="0" y="0" drill="5.5"/>
</package>
</packages>
<symbols>
<symbol name="MOUNT-HOLE">
<wire x1="0" y1="1.27" x2="1.27" y2="0" width="1.524" layer="94" curve="-90" cap="flat"/>
<wire x1="-1.27" y1="0" x2="0" y2="-1.27" width="1.524" layer="94" curve="90" cap="flat"/>
<wire x1="-0.508" y1="0" x2="0.508" y2="0" width="0.0508" layer="94"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.0508" layer="94"/>
<circle x="0" y="0" radius="2.032" width="0.0508" layer="94"/>
<circle x="0" y="0" radius="0.508" width="0.0508" layer="94"/>
<text x="2.032" y="0.5842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.032" y="-2.4638" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOUNT-HOLE" prefix="H">
<description>&lt;b&gt;MOUNTING HOLE&lt;/b&gt; with drill center marker</description>
<gates>
<gate name="G$1" symbol="MOUNT-HOLE" x="0" y="0"/>
</gates>
<devices>
<device name="2.8" package="2,8">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.0" package="3,0">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.3" package="3,3">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.6" package="3,6">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.1" package="4,1">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.5" package="4,5">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.0" package="5,0">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.2" package="3,2">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.3" package="4,3">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.5" package="5,5">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-Connectors">
<description>&lt;h3&gt;SparkFun Connectors&lt;/h3&gt;
This library contains electrically-functional connectors. 
&lt;br&gt;
&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is &lt;b&gt; the end user's responsibility&lt;/b&gt; to ensure correctness and suitablity for a given componet or application. 
&lt;br&gt;
&lt;br&gt;If you enjoy using this library, please buy one of our products at &lt;a href=" www.sparkfun.com"&gt;SparkFun.com&lt;/a&gt;.
&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;
&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="2X3-SHROUDED">
<description>&lt;h3&gt;Plated Through Hole - 2x3 Shrouded Header&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/Shrouded-10pin.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="4.5" y1="7.56" x2="4.5" y2="-7.56" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="-7.56" x2="-4.5" y2="-2.2" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="-2.2" x2="-4.5" y2="2.2" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="2.2" x2="-4.5" y2="7.56" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="7.56" x2="4.4" y2="7.56" width="0.2032" layer="21"/>
<wire x1="4.5" y1="-7.56" x2="-4.5" y2="-7.56" width="0.2032" layer="21"/>
<wire x1="-3.4" y1="6.46" x2="3.4" y2="6.46" width="0.2032" layer="51"/>
<wire x1="3.4" y1="6.46" x2="3.4" y2="-6.46" width="0.2032" layer="51"/>
<wire x1="-3.4" y1="-6.46" x2="3.4" y2="-6.46" width="0.2032" layer="51"/>
<wire x1="-4.5" y1="2.2" x2="-3" y2="2.2" width="0.2032" layer="21"/>
<wire x1="-3" y1="2.2" x2="-3" y2="-2.2" width="0.2032" layer="21"/>
<wire x1="-3" y1="-2.2" x2="-4.5" y2="-2.2" width="0.2032" layer="21"/>
<wire x1="-3.4" y1="6.46" x2="-3.4" y2="2.2" width="0.2032" layer="51"/>
<wire x1="-3.4" y1="-6.46" x2="-3.4" y2="-2.2" width="0.2032" layer="51"/>
<pad name="1" x="-1.27" y="2.54" drill="1.016" diameter="1.8796" rot="R270"/>
<pad name="2" x="1.27" y="2.54" drill="1.016" diameter="1.8796" rot="R270"/>
<pad name="3" x="-1.27" y="0" drill="1.016" diameter="1.8796" rot="R270"/>
<pad name="4" x="1.27" y="0" drill="1.016" diameter="1.8796" rot="R270"/>
<pad name="5" x="-1.27" y="-2.54" drill="1.016" diameter="1.8796" rot="R270"/>
<pad name="6" x="1.27" y="-2.54" drill="1.016" diameter="1.8796" rot="R270"/>
<rectangle x1="1.016" y1="2.286" x2="1.524" y2="2.794" layer="51"/>
<rectangle x1="-1.524" y1="2.286" x2="-1.016" y2="2.794" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-2.794" x2="1.524" y2="-2.286" layer="51"/>
<rectangle x1="-1.524" y1="-2.794" x2="-1.016" y2="-2.286" layer="51"/>
<rectangle x1="-1.524" y1="-2.794" x2="-1.016" y2="-2.286" layer="51"/>
<rectangle x1="1.016" y1="-2.794" x2="1.524" y2="-2.286" layer="51"/>
<text x="-3.81" y="7.874" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-3.81" y="-8.382" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="-2.648" y1="3.175" x2="-2.648" y2="1.905" width="0.2032" layer="21"/>
<wire x1="-2.686" y1="3.175" x2="-2.686" y2="1.905" width="0.2032" layer="22"/>
</package>
<package name="2X3_SMT_POSTS">
<description>&lt;h3&gt;Surface Mount - 2x3 Male Header with Keying Posts&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://www.4uconnector.com/online/object/4udrawing/15881.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<hole x="-1.27" y="0" drill="1.8"/>
<hole x="1.27" y="0" drill="1.8"/>
<smd name="4" x="0" y="2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<smd name="3" x="0" y="-2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<smd name="5" x="2.54" y="-2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<smd name="6" x="2.54" y="2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<smd name="2" x="-2.54" y="2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<smd name="1" x="-2.54" y="-2.54" dx="3.17" dy="1" layer="1" rot="R90"/>
<wire x1="-1.778" y1="2.54" x2="-0.762" y2="2.54" width="0.2032" layer="21"/>
<wire x1="0.762" y1="2.54" x2="1.778" y2="2.54" width="0.2032" layer="21"/>
<wire x1="-1.778" y1="-2.54" x2="-0.889" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="0.762" y1="-2.54" x2="1.778" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-3.81" y2="2.54" width="0.2032" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="-3.175" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="2.54" width="0.2032" layer="21"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-2.54" x2="3.175" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-3.429" y1="-4.064" x2="-3.429" y2="-2.794" width="0.2032" layer="21"/>
<text x="-1.397" y="4.445" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.778" y="-5.08" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="2X3_POGO">
<description>&lt;h3&gt;Plated Through Hole - 2x3 Pogo Pins&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="P$1" x="0" y="0" drill="1.2" diameter="1.8288"/>
<pad name="P$3" x="2.54" y="0" drill="1.2" diameter="1.8288"/>
<pad name="P$5" x="5.08" y="0" drill="1.2" diameter="1.8288"/>
<pad name="P$6" x="5.08" y="2.54" drill="1.2" diameter="1.8288"/>
<pad name="P$4" x="2.54" y="2.54" drill="1.2" diameter="1.8288"/>
<pad name="P$2" x="0" y="2.54" drill="1.2" diameter="1.8288"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="1.905" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="3.175" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="3.175" x2="-0.635" y2="3.81" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="3.81" x2="0.635" y2="3.81" width="0.2032" layer="21"/>
<wire x1="0.635" y1="3.81" x2="1.27" y2="3.175" width="0.2032" layer="21"/>
<wire x1="1.27" y1="3.175" x2="1.905" y2="3.81" width="0.2032" layer="21"/>
<wire x1="1.905" y1="3.81" x2="3.175" y2="3.81" width="0.2032" layer="21"/>
<wire x1="3.175" y1="3.81" x2="3.81" y2="3.175" width="0.2032" layer="21"/>
<wire x1="3.81" y1="3.175" x2="4.445" y2="3.81" width="0.2032" layer="21"/>
<wire x1="4.445" y1="3.81" x2="5.715" y2="3.81" width="0.2032" layer="21"/>
<wire x1="5.715" y1="3.81" x2="6.35" y2="3.175" width="0.2032" layer="21"/>
<wire x1="6.35" y1="3.175" x2="6.35" y2="1.905" width="0.2032" layer="21"/>
<wire x1="6.35" y1="1.905" x2="5.715" y2="1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="0" width="0.2032" layer="21"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="0" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.651" x2="0.635" y2="-1.651" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="3.175" x2="-0.635" y2="3.81" width="0.2032" layer="21"/>
<text x="-1.27" y="4.064" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.413" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="0.635" y1="-1.651" x2="-0.635" y2="-1.651" width="0.2032" layer="22"/>
</package>
<package name="2X3">
<description>&lt;h3&gt;Plated Through Hole - 2x3&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.905" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="6.35" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.27" y2="3.175" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="3.175" x2="-0.635" y2="3.81" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="3.81" x2="0.635" y2="3.81" width="0.2032" layer="21"/>
<wire x1="0.635" y1="3.81" x2="1.27" y2="3.175" width="0.2032" layer="21"/>
<wire x1="1.27" y1="3.175" x2="1.905" y2="3.81" width="0.2032" layer="21"/>
<wire x1="1.905" y1="3.81" x2="3.175" y2="3.81" width="0.2032" layer="21"/>
<wire x1="3.175" y1="3.81" x2="3.81" y2="3.175" width="0.2032" layer="21"/>
<wire x1="3.81" y1="3.175" x2="4.445" y2="3.81" width="0.2032" layer="21"/>
<wire x1="4.445" y1="3.81" x2="5.715" y2="3.81" width="0.2032" layer="21"/>
<wire x1="5.715" y1="3.81" x2="6.35" y2="3.175" width="0.2032" layer="21"/>
<wire x1="1.27" y1="3.175" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="3.175" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="3.175" x2="6.35" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="5.715" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="3.175" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.605" x2="-0.635" y2="-1.605" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="0" y="2.54" drill="1.016" diameter="1.8796"/>
<pad name="3" x="2.54" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="2.54" y="2.54" drill="1.016" diameter="1.8796"/>
<pad name="5" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="6" x="5.08" y="2.54" drill="1.016" diameter="1.8796"/>
<text x="-1.27" y="4.064" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.413" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="2.286" x2="0.254" y2="2.794" layer="51"/>
<rectangle x1="2.286" y1="2.286" x2="2.794" y2="2.794" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="2.286" x2="5.334" y2="2.794" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<wire x1="-0.635" y1="-1.605" x2="0.635" y2="-1.605" width="0.2032" layer="22"/>
</package>
<package name="2X3-NS">
<description>&lt;h3&gt;Plated Through Hole - 2x3 No Silk Outline&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="1.905" width="0.2032" layer="51"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.2032" layer="51"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.2032" layer="51"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.2032" layer="51"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.2032" layer="51"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.2032" layer="51"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.2032" layer="51"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.2032" layer="51"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.2032" layer="51"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.2032" layer="51"/>
<wire x1="-1.905" y1="-2.875" x2="-3.175" y2="-2.875" width="0.2032" layer="51"/>
<pad name="1" x="-2.54" y="-1.27" drill="1.016" diameter="1.8796"/>
<pad name="2" x="-2.54" y="1.27" drill="1.016" diameter="1.8796"/>
<pad name="3" x="0" y="-1.27" drill="1.016" diameter="1.8796"/>
<pad name="4" x="0" y="1.27" drill="1.016" diameter="1.8796"/>
<pad name="5" x="2.54" y="-1.27" drill="1.016" diameter="1.8796"/>
<pad name="6" x="2.54" y="1.27" drill="1.016" diameter="1.8796"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<text x="-3.81" y="2.667" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-3.81" y="-3.937" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="2X3_SMD">
<description>&lt;h3&gt;Surface Mount - 2x3&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:2.54mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_03x2&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<circle x="0" y="1.27" radius="0.7" width="0.127" layer="51"/>
<circle x="-2.54" y="1.27" radius="0.7" width="0.127" layer="51"/>
<circle x="-2.54" y="-1.27" radius="0.7" width="0.127" layer="51"/>
<circle x="0" y="-1.27" radius="0.7" width="0.127" layer="51"/>
<circle x="2.54" y="-1.27" radius="0.7" width="0.127" layer="51"/>
<circle x="2.54" y="1.27" radius="0.7" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-2.5" x2="-3.81" y2="2.5" width="0.127" layer="51"/>
<wire x1="-3.81" y1="2.5" x2="3.81" y2="2.5" width="0.127" layer="51"/>
<wire x1="3.81" y1="2.5" x2="3.81" y2="-2.5" width="0.127" layer="51"/>
<wire x1="3.81" y1="-2.5" x2="-3.81" y2="-2.5" width="0.127" layer="51"/>
<rectangle x1="-0.3" y1="2.55" x2="0.3" y2="3.35" layer="51"/>
<rectangle x1="-2.84" y1="2.55" x2="-2.24" y2="3.35" layer="51"/>
<rectangle x1="2.24" y1="2.55" x2="2.84" y2="3.35" layer="51"/>
<rectangle x1="-2.84" y1="-3.35" x2="-2.24" y2="-2.55" layer="51" rot="R180"/>
<rectangle x1="-0.3" y1="-3.35" x2="0.3" y2="-2.55" layer="51" rot="R180"/>
<rectangle x1="2.24" y1="-3.35" x2="2.84" y2="-2.55" layer="51" rot="R180"/>
<smd name="1" x="-2.54" y="-2.85" dx="1.02" dy="1.9" layer="1"/>
<smd name="2" x="-2.54" y="2.85" dx="1.02" dy="1.9" layer="1"/>
<smd name="3" x="0" y="-2.85" dx="1.02" dy="1.9" layer="1"/>
<smd name="4" x="0" y="2.85" dx="1.02" dy="1.9" layer="1"/>
<smd name="5" x="2.54" y="-2.85" dx="1.02" dy="1.9" layer="1"/>
<smd name="6" x="2.54" y="2.85" dx="1.02" dy="1.9" layer="1"/>
<text x="-1.397" y="4.191" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.778" y="-4.826" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="-3.302" y1="-3.683" x2="-3.302" y2="-2.794" width="0.127" layer="21"/>
</package>
<package name="1X01_LONGPAD">
<description>&lt;h3&gt;Plated Through Hole - Long Pad&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<text x="-1.27" y="2.032" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.667" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
<package name="1X01">
<description>&lt;h3&gt;Plated Through Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="1.27" y1="0.635" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="-0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-1.524" size="0.6096" layer="27" font="vector" ratio="20" align="top-left">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
<package name="1X01_2MM">
<description>&lt;h3&gt;Plated Through Hole - 2mm&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="2" diameter="3.302" rot="R90"/>
<text x="-1.651" y="1.778" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-2.413" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X01_OFFSET">
<description>&lt;h3&gt;Plated Through Hole - Long Pad w/ Offset Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1176" diameter="1.8796" shape="offset" rot="R90"/>
<text x="-1.27" y="3.048" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
<package name="1X01_POGOPIN_HOLE_0.061_DIA">
<description>&lt;h3&gt;Pogo Pin - 0.061"&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.061"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<circle x="0" y="0" radius="0.635" width="0.127" layer="51"/>
<pad name="1" x="0" y="0" drill="0.9" diameter="0.8128" rot="R90" thermals="no"/>
<hole x="0" y="0" drill="1.5494"/>
<text x="-1.27" y="1.143" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-1.778" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X01_POGOPIN_HOLE_0.58_DIA">
<description>&lt;h3&gt;Pogo Pin Hole - 0.58" &lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.58"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<circle x="0" y="0" radius="0.635" width="0.127" layer="51"/>
<pad name="1" x="0" y="0" drill="0.9" diameter="0.8128" rot="R90" thermals="no"/>
<hole x="0" y="0" drill="1.4732"/>
<text x="-1.27" y="1.143" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-1.778" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="SNAP-FEMALE">
<description>&lt;h3&gt;Sew-On Fabric Snap - Female&lt;/h3&gt;
Equivalent to size #1/0 snap. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 1&lt;/li&gt;
&lt;li&gt;Area:8mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="2.921" diameter="4.572"/>
<polygon width="0.254" layer="1">
<vertex x="-4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="4.0005" curve="-90.002865"/>
<vertex x="4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="-4.0005" curve="-89.997136"/>
</polygon>
<polygon width="0.3556" layer="29">
<vertex x="-4.0005" y="0" curve="-90.002865"/>
<vertex x="0" y="4.0005" curve="-90.002865"/>
<vertex x="4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="-4.0005" curve="-89.997136"/>
</polygon>
<polygon width="0.3556" layer="31">
<vertex x="-4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="4.0005" curve="-90.002865"/>
<vertex x="4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="-4.0005" curve="-89.997136"/>
</polygon>
<polygon width="0.3556" layer="41">
<vertex x="-4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="4.0005" curve="-90.002865"/>
<vertex x="4.0005" y="0" curve="-89.997136"/>
<vertex x="0" y="-4.0005" curve="-89.997136"/>
</polygon>
<text x="-1.27" y="4.318" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-4.953" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="SNAP-MALE">
<description>&lt;h3&gt;Sew-On Fabric Snap - Male&lt;/h3&gt;
Equivalent to size #1/0 snap. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 1&lt;/li&gt;
&lt;li&gt;Area:8mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<smd name="2" x="0" y="0" dx="7.62" dy="7.62" layer="1" roundness="100"/>
<text x="-1.524" y="4.064" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-4.826" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="SPRING-CONNECTOR">
<description>&lt;h3&gt;Spring Connector&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 1&lt;/li&gt;
&lt;li&gt;Area:0.25"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<smd name="P$2" x="0" y="0" dx="7.112" dy="7.112" layer="1" roundness="100"/>
<text x="-1.27" y="3.81" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.524" y="-4.572" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X01NS_KIT">
<description>&lt;h3&gt;Plated Through Hole - No Silk Outline Kit Version&lt;/h3&gt;
&lt;p&gt; Mask on only one side to make soldering in kits easier.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90" stop="no"/>
<circle x="0" y="0" radius="0.508" width="0" layer="29"/>
<circle x="0" y="0" radius="0.9398" width="0" layer="30"/>
<text x="-1.27" y="1.143" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-1.016" size="0.6096" layer="27" font="vector" ratio="20" align="top-left">&gt;VALUE</text>
</package>
<package name="1X01_NO_SILK">
<description>&lt;h3&gt;Plated Through Hole - No Silk Outline&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:1&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<text x="-1.27" y="1.143" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-1.778" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
<package name="SMTSO-256-ET-0.165DIA">
<description>&lt;h3&gt;SMTSO-256-ET Flush Mount Nut&lt;/h3&gt;
.165 drill
&lt;br&gt;
Fits 4-40 Screws. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 1&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_01&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<circle x="0" y="0" radius="1.016" width="0.127" layer="51"/>
<wire x1="-1.016" y1="2.286" x2="-2.286" y2="1.016" width="1.016" layer="31" curve="42.075022"/>
<wire x1="2.286" y1="1.016" x2="1.016" y2="2.286" width="1.016" layer="31" curve="42.075022"/>
<wire x1="1.016" y1="-2.286" x2="2.286" y2="-1.016" width="1.016" layer="31" curve="42.075022"/>
<wire x1="-2.286" y1="-1.016" x2="-1.016" y2="-2.286" width="1.016" layer="31" curve="42.075022"/>
<pad name="P$1" x="0" y="0" drill="4.191" diameter="6.1976"/>
<text x="-1.397" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.524" y="-3.937" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="0.635" x2="4.445" y2="1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.985" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="MOLEX-1X4">
<description>&lt;h3&gt;Molex 4-Pin Plated Through-Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="3.048" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="8.89" y1="3.048" x2="8.89" y2="-2.54" width="0.127" layer="21"/>
<wire x1="8.89" y1="3.048" x2="-1.27" y2="3.048" width="0.127" layer="21"/>
<wire x1="8.89" y1="-2.54" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<wire x1="7.62" y1="-2.54" x2="0" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="-1.27" x2="7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="-1.27" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" shape="square"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796"/>
<text x="2.286" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="2.286" y="-3.429" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="SCREWTERMINAL-3.5MM-4">
<description>&lt;h3&gt;Screw Terminal  3.5mm Pitch -4 Pin PTH&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 4&lt;/li&gt;
&lt;li&gt;Pin pitch: 3.5mm/138mil&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/Screw-Terminal-3.5mm.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.75" y1="3.4" x2="12.25" y2="3.4" width="0.2032" layer="21"/>
<wire x1="12.25" y1="3.4" x2="12.25" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-2.8" x2="12.25" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-3.6" x2="-1.75" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-3.6" x2="-1.75" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-2.8" x2="-1.75" y2="3.4" width="0.2032" layer="21"/>
<wire x1="12.25" y1="-2.8" x2="-1.75" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-1.35" x2="-2.25" y2="-1.35" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-1.35" x2="-2.25" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-2.35" x2="-1.75" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="12.25" y1="3.15" x2="12.75" y2="3.15" width="0.2032" layer="51"/>
<wire x1="12.75" y1="3.15" x2="12.75" y2="2.15" width="0.2032" layer="51"/>
<wire x1="12.75" y1="2.15" x2="12.25" y2="2.15" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="3.5" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="7" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="10.5" y="0" radius="0.425" width="0.001" layer="51"/>
<pad name="1" x="0" y="0" drill="1.2" diameter="2.032" shape="square"/>
<pad name="2" x="3.5" y="0" drill="1.2" diameter="2.032"/>
<pad name="3" x="7" y="0" drill="1.2" diameter="2.032"/>
<pad name="4" x="10.5" y="0" drill="1.2" diameter="2.032"/>
<text x="0" y="2.413" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="0" y="-2.286" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_1.27MM">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch: 1.27mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-0.381" y1="-0.889" x2="0.381" y2="-0.889" width="0.127" layer="21"/>
<wire x1="0.381" y1="-0.889" x2="0.635" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="-0.635" x2="0.889" y2="-0.889" width="0.127" layer="21"/>
<wire x1="0.889" y1="-0.889" x2="1.651" y2="-0.889" width="0.127" layer="21"/>
<wire x1="1.651" y1="-0.889" x2="1.905" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.905" y1="-0.635" x2="2.159" y2="-0.889" width="0.127" layer="21"/>
<wire x1="2.159" y1="-0.889" x2="2.921" y2="-0.889" width="0.127" layer="21"/>
<wire x1="2.921" y1="-0.889" x2="3.175" y2="-0.635" width="0.127" layer="21"/>
<wire x1="3.175" y1="-0.635" x2="3.429" y2="-0.889" width="0.127" layer="21"/>
<wire x1="3.429" y1="-0.889" x2="4.191" y2="-0.889" width="0.127" layer="21"/>
<wire x1="4.191" y1="0.889" x2="3.429" y2="0.889" width="0.127" layer="21"/>
<wire x1="3.429" y1="0.889" x2="3.175" y2="0.635" width="0.127" layer="21"/>
<wire x1="3.175" y1="0.635" x2="2.921" y2="0.889" width="0.127" layer="21"/>
<wire x1="2.921" y1="0.889" x2="2.159" y2="0.889" width="0.127" layer="21"/>
<wire x1="2.159" y1="0.889" x2="1.905" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.905" y1="0.635" x2="1.651" y2="0.889" width="0.127" layer="21"/>
<wire x1="1.651" y1="0.889" x2="0.889" y2="0.889" width="0.127" layer="21"/>
<wire x1="0.889" y1="0.889" x2="0.635" y2="0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.381" y2="0.889" width="0.127" layer="21"/>
<wire x1="0.381" y1="0.889" x2="-0.381" y2="0.889" width="0.127" layer="21"/>
<wire x1="-0.381" y1="0.889" x2="-0.889" y2="0.381" width="0.127" layer="21"/>
<wire x1="-0.889" y1="-0.381" x2="-0.381" y2="-0.889" width="0.127" layer="21"/>
<wire x1="-0.889" y1="0.381" x2="-0.889" y2="-0.381" width="0.127" layer="21"/>
<wire x1="4.191" y1="0.889" x2="4.699" y2="0.381" width="0.127" layer="21"/>
<wire x1="4.699" y1="0.381" x2="4.699" y2="-0.381" width="0.127" layer="21"/>
<wire x1="4.699" y1="-0.381" x2="4.191" y2="-0.889" width="0.127" layer="21"/>
<pad name="4" x="3.81" y="0" drill="0.508" diameter="1"/>
<pad name="3" x="2.54" y="0" drill="0.508" diameter="1"/>
<pad name="2" x="1.27" y="0" drill="0.508" diameter="1"/>
<pad name="1" x="0" y="0" drill="0.508" diameter="1"/>
<text x="-0.508" y="1.016" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-0.508" y="-1.651" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_LOCK">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin Locking Footprint&lt;/h3&gt;
Pins are offset 0.005" from center to lock pins in place during soldering. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="0.635" x2="4.445" y2="1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.985" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0.127" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="-0.127" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0.127" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="-0.127" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_LOCK_LONGPADS">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin Long Pads w/ Locking Footprint&lt;/h3&gt;
Holes are offset 0.005" from center to lock pins in place during soldering. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="1.524" y1="-0.127" x2="1.016" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="4.064" y1="-0.127" x2="3.556" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="6.604" y1="-0.127" x2="6.096" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.016" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.27" y2="0.8636" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.8636" x2="-0.9906" y2="1.143" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.27" y2="-1.1176" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-1.1176" x2="-0.9906" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.127" x2="8.636" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.127" x2="8.89" y2="-1.1176" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-1.1176" x2="8.6106" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.127" x2="8.89" y2="0.8636" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.8636" x2="8.6106" y2="1.143" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="-0.254" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="-0.254" drill="1.016" shape="long" rot="R90"/>
<rectangle x1="-0.2921" y1="-0.4191" x2="0.2921" y2="0.1651" layer="51"/>
<rectangle x1="2.2479" y1="-0.4191" x2="2.8321" y2="0.1651" layer="51"/>
<rectangle x1="4.7879" y1="-0.4191" x2="5.3721" y2="0.1651" layer="51"/>
<rectangle x1="7.3279" y1="-0.4191" x2="7.9121" y2="0.1651" layer="51" rot="R90"/>
<text x="-1.27" y="1.651" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.413" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="MOLEX-1X4_LOCK">
<description>&lt;h3&gt;Molex 4-Pin Plated Through-Hole Locking&lt;/h3&gt;
Holes are offset 0.005" from center to hold pins in place during soldering. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="3.048" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="8.89" y1="3.048" x2="8.89" y2="-2.54" width="0.127" layer="21"/>
<wire x1="8.89" y1="3.048" x2="-1.27" y2="3.048" width="0.127" layer="21"/>
<wire x1="8.89" y1="-2.54" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<wire x1="7.62" y1="-2.54" x2="0" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="-1.27" x2="7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="-1.27" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<pad name="1" x="0" y="0.127" drill="1.016" diameter="1.8796" shape="square"/>
<pad name="2" x="2.54" y="-0.127" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0.127" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="-0.127" drill="1.016" diameter="1.8796"/>
<text x="2.667" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="2.032" y="-3.556" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_SMD_RA_MALE">
<description>&lt;h3&gt;SMD - 4 Pin Right Angle Male Header&lt;/h3&gt;
tDocu layer shows pin locations.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="5.08" y1="1.25" x2="-5.08" y2="1.25" width="0.127" layer="51"/>
<wire x1="-5.08" y1="1.25" x2="-5.08" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-5.08" y1="-1.25" x2="-3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="5.08" y2="-1.25" width="0.127" layer="51"/>
<wire x1="5.08" y1="-1.25" x2="5.08" y2="1.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="3.81" y2="-7.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="-1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-3.81" y2="-7.25" width="0.127" layer="51"/>
<smd name="4" x="3.81" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="3" x="1.27" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="2" x="-1.27" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="1" x="-3.81" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<hole x="-2.54" y="0" drill="1.4"/>
<hole x="2.54" y="0" drill="1.4"/>
<text x="-4.318" y="6.731" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-4.318" y="2.667" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_LONGPADS">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin Long Pads&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="2.032" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.667" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_NO_SILK">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin No Silk Outline&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="JST-4-PTH">
<description>&lt;h3&gt;JST Right Angle 4 Pin Plated Through Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 4&lt;/li&gt;
&lt;li&gt;Pin pitch: 2mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/ePH.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="-3" y="0" drill="0.7" diameter="1.6"/>
<pad name="2" x="-1" y="0" drill="0.7" diameter="1.6"/>
<pad name="3" x="1" y="0" drill="0.7" diameter="1.6"/>
<pad name="4" x="3" y="0" drill="0.7" diameter="1.6"/>
<text x="-3.4" y="0.7" size="1.27" layer="51">+</text>
<text x="-1.4" y="0.7" size="1.27" layer="51">-</text>
<text x="0.7" y="0.9" size="0.8" layer="51">S</text>
<text x="2.7" y="0.9" size="0.8" layer="51">S</text>
<wire x1="-4.95" y1="-1.6" x2="-4.95" y2="6" width="0.2032" layer="21"/>
<wire x1="-4.95" y1="6" x2="4.95" y2="6" width="0.2032" layer="21"/>
<wire x1="4.95" y1="6" x2="4.95" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-4.95" y1="-1.6" x2="-4.3" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="4.95" y1="-1.6" x2="4.3" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-4.3" y1="-1.6" x2="-4.3" y2="0" width="0.2032" layer="21"/>
<wire x1="4.3" y1="-1.6" x2="4.3" y2="0" width="0.2032" layer="21"/>
<text x="-1.397" y="3.429" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="2.54" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="SCREWTERMINAL-3.5MM-4_LOCK">
<description>&lt;h3&gt;Screw Terminal  3.5mm Pitch -4 Pin PTH Locking&lt;/h3&gt;
Holes are offset 0.005" from center to hold pins in place during soldering. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 4&lt;/li&gt;
&lt;li&gt;Pin pitch: 3.5mm/138mil&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/Screw-Terminal-3.5mm.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-2.3" y1="3.4" x2="12.8" y2="3.4" width="0.2032" layer="21"/>
<wire x1="12.8" y1="3.4" x2="12.8" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="12.8" y1="-2.8" x2="12.8" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="12.8" y1="-3.6" x2="-2.3" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="-2.3" y1="-3.6" x2="-2.3" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-2.3" y1="-2.8" x2="-2.3" y2="3.4" width="0.2032" layer="21"/>
<wire x1="12.8" y1="-2.8" x2="-2.3" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-2.3" y1="-1.35" x2="-2.7" y2="-1.35" width="0.2032" layer="51"/>
<wire x1="-2.7" y1="-1.35" x2="-2.7" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="-2.7" y1="-2.35" x2="-2.3" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="12.8" y1="3.15" x2="13.2" y2="3.15" width="0.2032" layer="51"/>
<wire x1="13.2" y1="3.15" x2="13.2" y2="2.15" width="0.2032" layer="51"/>
<wire x1="13.2" y1="2.15" x2="12.8" y2="2.15" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="3.5" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="7" y="0" radius="0.425" width="0.001" layer="51"/>
<circle x="10.5" y="0" radius="0.425" width="0.001" layer="51"/>
<pad name="1" x="-0.1778" y="0" drill="1.2" diameter="2.032" shape="square"/>
<pad name="2" x="3.6778" y="0" drill="1.2" diameter="2.032"/>
<pad name="3" x="6.8222" y="0" drill="1.2" diameter="2.032"/>
<pad name="4" x="10.6778" y="0" drill="1.2" diameter="2.032"/>
<text x="3.81" y="2.413" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="3.81" y="1.524" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_1MM_RA">
<description>&lt;h3&gt;SMD- 4 Pin Right Angle &lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.5" y1="-4.6" x2="1.5" y2="-4.6" width="0.254" layer="21"/>
<wire x1="-3" y1="-2" x2="-3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="2.25" y1="-0.35" x2="3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="3" y1="-0.35" x2="3" y2="-2" width="0.254" layer="21"/>
<wire x1="-3" y1="-0.35" x2="-2.25" y2="-0.35" width="0.254" layer="21"/>
<circle x="-2.5" y="0.3" radius="0.1414" width="0.4" layer="21"/>
<smd name="NC2" x="-2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="NC1" x="2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="1" x="-1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="2" x="-0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="3" x="0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="4" x="1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<text x="-1.397" y="-2.159" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-3.302" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_SMD_VERTICAL_COMBO">
<description>&lt;h3&gt;SMD - 4 Pin Vertical Connector&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;SMD Pad count:8&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="0" y1="1.27" x2="0" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="-1.37" y1="-1.25" x2="-1.37" y2="1.25" width="0.1778" layer="21"/>
<wire x1="8.99" y1="1.25" x2="8.99" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="-0.73" y1="-1.25" x2="-1.37" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="8.99" y1="-1.25" x2="8.32" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="8.32" y1="1.25" x2="8.99" y2="1.25" width="0.1778" layer="21"/>
<wire x1="-1.37" y1="1.25" x2="-0.73" y2="1.25" width="0.1778" layer="21"/>
<wire x1="5.869" y1="-1.29" x2="6.831" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="5.869" y1="1.25" x2="6.831" y2="1.25" width="0.1778" layer="21"/>
<wire x1="3.329" y1="-1.29" x2="4.291" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="3.329" y1="1.25" x2="4.291" y2="1.25" width="0.1778" layer="21"/>
<wire x1="0.789" y1="-1.29" x2="1.751" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="0.789" y1="1.25" x2="1.751" y2="1.25" width="0.1778" layer="21"/>
<smd name="3" x="5.08" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="1" x="0" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="4" x="7.62" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="2" x="2.54" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="1-2" x="0" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="2-2" x="2.54" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="3-2" x="5.08" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="4-2" x="7.62" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<text x="-0.508" y="2.921" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-0.508" y="-3.429" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_SMD_LONG">
<description>&lt;h3&gt;SMD - 4 Pin w/ Long Solder Pads&lt;/h3&gt;
No silk, but tDocu layer shows pin position. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="5.08" y1="1.25" x2="-5.08" y2="1.25" width="0.127" layer="51"/>
<wire x1="-5.08" y1="1.25" x2="-5.08" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-5.08" y1="-1.25" x2="-3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="5.08" y2="-1.25" width="0.127" layer="51"/>
<wire x1="5.08" y1="-1.25" x2="5.08" y2="1.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="3.81" y2="-7.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="-1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-3.81" y2="-7.25" width="0.127" layer="51"/>
<smd name="4" x="3.81" y="5.5" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="3" x="1.27" y="5.5" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="2" x="-1.27" y="5.5" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="1" x="-3.81" y="5.5" dx="4" dy="1" layer="1" rot="R90"/>
<hole x="-2.54" y="0" drill="1.4"/>
<hole x="2.54" y="0" drill="1.4"/>
</package>
<package name="JST-4-PTH-VERT">
<description>&lt;h3&gt;JST Vertical 4 Pin Plated Through Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 4&lt;/li&gt;
&lt;li&gt;Pin pitch: 2mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href="http://www.jst-mfg.com/product/pdf/eng/ePH.pdf"&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-4.95" y1="-2.25" x2="-4.95" y2="2.25" width="0.2032" layer="21"/>
<wire x1="-4.95" y1="2.25" x2="4.95" y2="2.25" width="0.2032" layer="21"/>
<wire x1="4.95" y1="-2.25" x2="1" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="-1" y1="-2.25" x2="-4.95" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="-1" y1="-1.75" x2="1" y2="-1.75" width="0.2032" layer="21"/>
<wire x1="1" y1="-1.75" x2="1" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="-1" y1="-1.75" x2="-1" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="4.95" y1="2.25" x2="4.95" y2="-2.25" width="0.2032" layer="21"/>
<pad name="1" x="-3" y="-0.55" drill="0.7" diameter="1.6"/>
<pad name="2" x="-1" y="-0.55" drill="0.7" diameter="1.6"/>
<pad name="3" x="1" y="-0.55" drill="0.7" diameter="1.6"/>
<pad name="4" x="3" y="-0.55" drill="0.7" diameter="1.6"/>
<text x="-1.4" y="0.75" size="1.27" layer="51">+</text>
<text x="0.6" y="0.75" size="1.27" layer="51">-</text>
<text x="2.7" y="0.95" size="0.8" layer="51">Y</text>
<text x="-3.3" y="0.95" size="0.8" layer="51">B</text>
<text x="-1.143" y="2.54" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-3.302" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_SMD_RA_FEMALE">
<description>&lt;h3&gt;SMD - 4 Pin Right-Angle Female Header&lt;/h3&gt;
Silk outline shows header location. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-5.205" y1="4.25" x2="-5.205" y2="-4.25" width="0.1778" layer="21"/>
<wire x1="5.205" y1="4.25" x2="-5.205" y2="4.25" width="0.1778" layer="21"/>
<wire x1="5.205" y1="-4.25" x2="5.205" y2="4.25" width="0.1778" layer="21"/>
<wire x1="-5.205" y1="-4.25" x2="5.205" y2="-4.25" width="0.1778" layer="21"/>
<rectangle x1="-1.59" y1="6.8" x2="-0.95" y2="7.65" layer="51"/>
<rectangle x1="0.95" y1="6.8" x2="1.59" y2="7.65" layer="51"/>
<rectangle x1="-4.13" y1="6.8" x2="-3.49" y2="7.65" layer="51"/>
<smd name="3" x="1.27" y="7.225" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="2" x="-1.27" y="7.225" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="1" x="-3.81" y="7.225" dx="1.25" dy="3" layer="1" rot="R180"/>
<rectangle x1="3.49" y1="6.8" x2="4.13" y2="7.65" layer="51"/>
<smd name="4" x="3.81" y="7.225" dx="1.25" dy="3" layer="1" rot="R180"/>
<text x="-1.397" y="0.762" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.524" y="-1.27" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="CONN_03X2">
<description>&lt;h3&gt;6 Pin Connection&lt;/h3&gt;
3x2 pin layout</description>
<pin name="1" x="-7.62" y="2.54" visible="pad" length="middle"/>
<pin name="3" x="-7.62" y="0" visible="pad" length="middle"/>
<pin name="5" x="-7.62" y="-2.54" visible="pad" length="middle"/>
<pin name="6" x="7.62" y="-2.54" visible="pad" length="middle" rot="R180"/>
<pin name="4" x="7.62" y="0" visible="pad" length="middle" rot="R180"/>
<pin name="2" x="7.62" y="2.54" visible="pad" length="middle" rot="R180"/>
<text x="-3.556" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-3.302" y="-5.842" size="1.778" layer="96" font="vector" align="top-left">&gt;VALUE</text>
<wire x1="-1.27" y1="-2.54" x2="-2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="0" x2="-2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="-2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
</symbol>
<symbol name="CONN_01">
<description>&lt;h3&gt;1 Pin Connection&lt;/h3&gt;</description>
<wire x1="3.81" y1="-2.54" x2="-2.54" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="3.81" y2="2.54" width="0.4064" layer="94"/>
<text x="-2.54" y="-4.826" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="-2.54" y="3.048" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="1" x="7.62" y="0" visible="off" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="CONN_04">
<description>&lt;h3&gt;4 Pin Connection&lt;/h3&gt;</description>
<wire x1="1.27" y1="-5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="0" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="0" y2="5.08" width="0.6096" layer="94"/>
<text x="-5.08" y="-7.366" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="-5.08" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="1" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="5.08" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CONN_03X2" prefix="J" uservalue="yes">
<description>&lt;h3&gt;Multi connection point. Often used as Generic Header-pin footprint for 0.1 inch spaced/style header connections&lt;/h3&gt;

&lt;p&gt;&lt;/p&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;You can populate with any combo of single row headers, but if you'd like an exact match, check these:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/12807"&gt; Header - 2x3 (Male, 0.1")&lt;/a&gt; (PRT-12807)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/13010"&gt; Header - 2x3 (Female, 0.1")&lt;/a&gt; (PRT-13010)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/10877"&gt; 2x3 Pin Shrouded Header&lt;/a&gt; (PRT-10877)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;On any of the 0.1 inch spaced packages, you can populate with these:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/116"&gt; Break Away Headers - Straight&lt;/a&gt; (PRT-00116)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/553"&gt; Break Away Male Headers - Right Angle&lt;/a&gt; (PRT-00553)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/115"&gt; Female Headers&lt;/a&gt; (PRT-00115)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/117"&gt; Break Away Headers - Machine Pin&lt;/a&gt; (PRT-00117)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/743"&gt; Break Away Female Headers - Swiss Machine Pin&lt;/a&gt; (PRT-00743)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;Special note: the shrouded connector mates well with our 3x2 ribbon cables:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/10651"&gt; Ribbon Crimp Connector - 6-pin (2x3, Female)&lt;/a&gt; (PRT-10651)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/10646"&gt; Ribbon Cable - 6 wire (15ft)&lt;/a&gt; (PRT-10646)&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CONN_03X2" x="0" y="0"/>
</gates>
<devices>
<device name="SHROUD" package="2X3-SHROUDED">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-10681"/>
<attribute name="SF_ID" value="PRT_10877" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMT" package="2X3_SMT_POSTS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-11415"/>
</technology>
</technologies>
</device>
<device name="POGO_PINS" package="2X3_POGO">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
<connect gate="G$1" pin="5" pad="P$5"/>
<connect gate="G$1" pin="6" pad="P$6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="HW-11044"/>
</technology>
</technologies>
</device>
<device name="2X3_SILK_MALE_PTH" package="2X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09701"/>
</technology>
</technologies>
</device>
<device name="NO_SILK" package="2X3-NS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="FEMALE_SMD" package="2X3_SMD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-11290"/>
</technology>
</technologies>
</device>
<device name="FEMALE" package="2X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-11566"/>
<attribute name="VALUE" value="FEMALE 2x3"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CONN_01" prefix="J" uservalue="yes">
<description>&lt;h3&gt;Single connection point. Often used as Generic Header-pin footprint for 0.1 inch spaced/style header connections&lt;/h3&gt;
&lt;p&gt;&lt;/p&gt;

&lt;p&gt;&lt;/p&gt;
On any of the 0.1 inch spaced packages, you can populate with these:
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/116"&gt; Break Away Headers - Straight&lt;/a&gt; (PRT-00116)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/553"&gt; Break Away Male Headers - Right Angle&lt;/a&gt; (PRT-00553)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/115"&gt; Female Headers&lt;/a&gt; (PRT-00115)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/117"&gt; Break Away Headers - Machine Pin&lt;/a&gt; (PRT-00117)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/743"&gt; Break Away Female Headers - Swiss Machine Pin&lt;/a&gt; (PRT-00743)&lt;/li&gt;
&lt;p&gt;&lt;/p&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;/p&gt;
This device is also useful as a general connection point to wire up your design to another part of your project. Our various solder wires solder well into these plated through hole pads.
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11375"&gt; Hook-Up Wire - Assortment (Stranded, 22 AWG)&lt;/a&gt; (PRT-11375)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11367"&gt; Hook-Up Wire - Assortment (Solid Core, 22 AWG)&lt;/a&gt; (PRT-11367)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/categories/141"&gt; View the entire wire category on our website here&lt;/a&gt;&lt;/li&gt;
&lt;p&gt;&lt;/p&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;Special notes:&lt;/b&gt;
&lt;p&gt; &lt;/p&gt;
SMTSO-256-ET is a "flush mount" nut for a 4-40 screw. We mostly use this on specialty testbeds; it is a nice way to connect hardware to your PCB at an adjustable hieght.
&lt;p&gt;&lt;/p&gt;
Also note, the SNAP packages are for using a snappable style connector. We sell a baggie of snaps and they are also used on two LilyPad designs:
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11347"&gt; Snap Assortment - 30 pack (male and female)&lt;/a&gt; (DEV-11347)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/10941"&gt;LilyPad Arduino SimpleSnap&lt;/a&gt; (DEV-10941)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/10940"&gt; LilyPad SimpleSnap Protoboard&lt;/a&gt; (DEV-10940)&lt;/li&gt;
&lt;p&gt;&lt;/p&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CONN_01" x="0" y="0"/>
</gates>
<devices>
<device name="PTH_LONGPAD" package="1X01_LONGPAD">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="1X01">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH_2MM" package="1X01_2MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="OFFSET" package="1X01_OFFSET">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="POGOPIN_HOLE_LARGE" package="1X01_POGOPIN_HOLE_0.061_DIA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="POGOPIN_HOLE_0.58" package="1X01_POGOPIN_HOLE_0.58_DIA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SNAP-FEMALE" package="SNAP-FEMALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SNAP-MALE" package="SNAP-MALE">
<connects>
<connect gate="G$1" pin="1" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SPRING-CONN" package="SPRING-CONNECTOR">
<connects>
<connect gate="G$1" pin="1" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="SF_ID" value="PRT-11822" constant="no"/>
</technology>
</technologies>
</device>
<device name="PTH_NO_SILK_KIT" package="1X01NS_KIT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTH_NO_SILK_YES_STOP" package="1X01_NO_SILK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMTSO-256-ET-0.165DIA" package="SMTSO-256-ET-0.165DIA">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="HW-08694" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CONN_04" prefix="J" uservalue="yes">
<description>&lt;h3&gt;Multi connection point. Often used as Generic Header-pin footprint for 0.1 inch spaced/style header connections&lt;/h3&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;On any of the 0.1 inch spaced packages, you can populate with these:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/116"&gt; Break Away Headers - Straight&lt;/a&gt; (PRT-00116)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/553"&gt; Break Away Male Headers - Right Angle&lt;/a&gt; (PRT-00553)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/115"&gt; Female Headers&lt;/a&gt; (PRT-00115)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/117"&gt; Break Away Headers - Machine Pin&lt;/a&gt; (PRT-00117)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/743"&gt; Break Away Female Headers - Swiss Machine Pin&lt;/a&gt; (PRT-00743)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt; For SCREWTERMINALS and SPRING TERMINALS visit here:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/search/results?term=Screw+Terminals"&gt; Screw Terimnals on SparkFun.com&lt;/a&gt; (5mm/3.5mm/2.54mm spacing)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;This device is also useful as a general connection point to wire up your design to another part of your project. Our various solder wires solder well into these plated through hole pads.&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11375"&gt; Hook-Up Wire - Assortment (Stranded, 22 AWG)&lt;/a&gt; (PRT-11375)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11367"&gt; Hook-Up Wire - Assortment (Solid Core, 22 AWG)&lt;/a&gt; (PRT-11367)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/categories/141"&gt; View the entire wire category on our website here&lt;/a&gt;&lt;/li&gt;
&lt;p&gt;&lt;/p&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;Special notes:&lt;/b&gt;
&lt;p&gt; &lt;/p&gt; Molex polarized connector foot print use with SKU : PRT-08231 with associated crimp pins and housings. 1MM SMD Version SKU: PRT-10208</description>
<gates>
<gate name="G$1" symbol="CONN_04" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09696" constant="no"/>
</technology>
</technologies>
</device>
<device name="POLAR" package="MOLEX-1X4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08186" constant="no"/>
<attribute name="SF_ID" value="PRT-08231" constant="no"/>
</technology>
</technologies>
</device>
<device name="SCREW" package="SCREWTERMINAL-3.5MM-4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="2xCONN-08399" constant="no"/>
<attribute name="SF_ID" value="2xPRT-08084" constant="no"/>
</technology>
</technologies>
</device>
<device name="1.27MM" package="1X04_1.27MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LOCK" package="1X04_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09696" constant="no"/>
</technology>
</technologies>
</device>
<device name="LOCK_LONGPADS" package="1X04_LOCK_LONGPADS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09696" constant="no"/>
</technology>
</technologies>
</device>
<device name="POLAR_LOCK" package="MOLEX-1X4_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08186" constant="no"/>
<attribute name="SF_ID" value="PRT-08231" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD" package="1X04_SMD_RA_MALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09140" constant="no"/>
<attribute name="SF_ID" value="PRT-12638" constant="no"/>
</technology>
</technologies>
</device>
<device name="LONGPADS" package="1X04_LONGPADS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09696" constant="no"/>
</technology>
</technologies>
</device>
<device name="1X04_NO_SILK" package="1X04_NO_SILK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09696" constant="no"/>
</technology>
</technologies>
</device>
<device name="JST-PTH" package="JST-4-PTH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="WIRE-13531" constant="no"/>
<attribute name="SF_ID" value="PRT-09916" constant="no"/>
</technology>
</technologies>
</device>
<device name="SCREW_LOCK" package="SCREWTERMINAL-3.5MM-4_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD2" package="1X04_1MM_RA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-10310" constant="no"/>
<attribute name="SF_ID" value="PRT-10208" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMD_STRAIGHT_COMBO" package="1X04_SMD_VERTICAL_COMBO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08511"/>
<attribute name="VALUE" value="1X04_SMD_STRAIGHT_COMBO"/>
</technology>
</technologies>
</device>
<device name="SMD_LONG" package="1X04_SMD_LONG">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09140" constant="no"/>
<attribute name="SF_ID" value="PRT-12638" constant="no"/>
</technology>
</technologies>
</device>
<device name="JST-PTH-VERT" package="JST-4-PTH-VERT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-13251"/>
</technology>
</technologies>
</device>
<device name="SMD_RA_FEMALE" package="1X04_SMD_RA_FEMALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-12382" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="adafruit" urn="urn:adsk.eagle:library:420">
<packages>
<package name="1X2-3.5MM" library_version="1">
<wire x1="-3.4" y1="3.4" x2="-3.4" y2="-2.2" width="0.127" layer="21"/>
<wire x1="-3.4" y1="-2.2" x2="-3.4" y2="-3.6" width="0.127" layer="21"/>
<wire x1="-3.4" y1="-3.6" x2="3.6" y2="-3.6" width="0.127" layer="21"/>
<wire x1="3.6" y1="-3.6" x2="3.6" y2="-2.2" width="0.127" layer="21"/>
<wire x1="3.6" y1="-2.2" x2="3.6" y2="3.4" width="0.127" layer="21"/>
<wire x1="3.6" y1="3.4" x2="-3.4" y2="3.4" width="0.127" layer="21"/>
<wire x1="-3.4" y1="-2.2" x2="3.6" y2="-2.2" width="0.127" layer="21"/>
<pad name="1" x="1.8" y="0" drill="1" diameter="2.1844"/>
<pad name="2" x="-1.7" y="0" drill="1" diameter="2.1844"/>
<text x="3" y="5" size="1.27" layer="25" rot="R180">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="1X2" library_version="1">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="2.54" visible="pin" length="middle" direction="pas"/>
<pin name="2" x="-5.08" y="0" visible="pin" length="middle" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1X2" prefix="J" library_version="1">
<description>3.5mm Terminal block
&lt;p&gt;http://www.ladyada.net/library/pcb/eaglelibrary.html&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="1X2" x="0" y="0"/>
</gates>
<devices>
<device name="-3.5MM" package="1X2-3.5MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="adafruit">
<packages>
<package name="EVQ-Q2">
<wire x1="-3.3" y1="3" x2="3.3" y2="3" width="0.127" layer="21"/>
<wire x1="3.3" y1="3" x2="3.3" y2="-3" width="0.127" layer="21"/>
<wire x1="3.3" y1="-3" x2="-3.3" y2="-3" width="0.127" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3.3" y2="3" width="0.127" layer="21"/>
<circle x="0" y="0" radius="1.5033" width="0.127" layer="21"/>
<circle x="0" y="0" radius="1" width="0.127" layer="21"/>
<smd name="B" x="-3.4" y="2" dx="3.2" dy="1.2" layer="1"/>
<smd name="B'" x="3.4" y="2" dx="3.2" dy="1.2" layer="1"/>
<smd name="A'" x="3.4" y="-2" dx="3.2" dy="1.2" layer="1"/>
<smd name="A" x="-3.4" y="-2" dx="3.2" dy="1.2" layer="1"/>
<text x="-3" y="3.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.2" y="-4.8" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="KMR2">
<wire x1="-2.1" y1="1.4" x2="2.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="2.1" y1="1.4" x2="2.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="2.1" y1="-1.4" x2="-2.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="-2.1" y1="-1.4" x2="-2.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-0.8" x2="-1.1" y2="-0.2" width="0.127" layer="21" curve="-90"/>
<wire x1="-1.1" y1="-0.2" x2="-1.1" y2="0.2" width="0.127" layer="21"/>
<wire x1="-1.1" y1="0.2" x2="-0.5" y2="0.8" width="0.127" layer="21" curve="-90"/>
<wire x1="-0.5" y1="0.8" x2="0.5" y2="0.8" width="0.127" layer="21"/>
<wire x1="0.5" y1="0.8" x2="1.1" y2="0.2" width="0.127" layer="21" curve="-90"/>
<wire x1="1.1" y1="0.2" x2="1.1" y2="-0.2" width="0.127" layer="21"/>
<wire x1="1.1" y1="-0.2" x2="0.5" y2="-0.8" width="0.127" layer="21" curve="-90"/>
<wire x1="0.5" y1="-0.8" x2="-0.5" y2="-0.8" width="0.127" layer="21"/>
<smd name="1" x="2" y="0.8" dx="1" dy="1" layer="1"/>
<smd name="2" x="2" y="-0.8" dx="1" dy="1" layer="1"/>
<smd name="4" x="-2" y="-0.8" dx="1" dy="1" layer="1"/>
<smd name="3" x="-2" y="0.8" dx="1" dy="1" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="TS2">
<wire x1="0" y1="1.905" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.905" x2="-3.175" y2="1.905" width="0.254" layer="94"/>
<wire x1="-4.445" y1="-1.905" x2="-3.175" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.905" x2="-4.445" y2="0" width="0.254" layer="94"/>
<wire x1="-4.445" y1="0" x2="-4.445" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="0" x2="-3.175" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="1.905" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.127" width="0.4064" layer="94"/>
<circle x="0" y="2.54" radius="0.127" width="0.4064" layer="94"/>
<text x="-6.35" y="-2.54" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="3.175" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="P" x="0" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="S" x="0" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="S1" x="2.54" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="P1" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="2" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SPST_TACT" prefix="SW">
<description>SMT 6mm switch, EVQQ2 series
&lt;p&gt;http://www.ladyada.net/library/eagle&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="TS2" x="0" y="0"/>
</gates>
<devices>
<device name="-EVQQ2" package="EVQ-Q2">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="A'"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="B'"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-KMR2" package="KMR2">
<connects>
<connect gate="G$1" pin="P" pad="1"/>
<connect gate="G$1" pin="P1" pad="3"/>
<connect gate="G$1" pin="S" pad="2"/>
<connect gate="G$1" pin="S1" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="zetex">
<packages>
<package name="SOT-23">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt;</description>
<wire x1="-1.4224" y1="0.381" x2="1.4732" y2="0.381" width="0.1524" layer="21"/>
<wire x1="1.4732" y1="0.381" x2="1.4732" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="1.4732" y1="-0.381" x2="-1.4224" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.4224" y1="-0.381" x2="-1.4224" y2="0.381" width="0.1524" layer="21"/>
<smd name="3" x="0.9906" y="1.016" dx="0.7874" dy="0.889" layer="1"/>
<smd name="2" x="-0.9398" y="1.016" dx="0.7874" dy="0.889" layer="1"/>
<smd name="1" x="0.0254" y="-1.016" dx="0.7874" dy="0.889" layer="1"/>
<text x="-1.397" y="1.778" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.397" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="0.7874" y1="0.4318" x2="1.1684" y2="0.9398" layer="51"/>
<rectangle x1="-1.143" y1="0.4318" x2="-0.762" y2="0.9398" layer="51"/>
<rectangle x1="-0.1778" y1="-0.9398" x2="0.2032" y2="-0.4318" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="P_MOSFET">
<wire x1="-1.651" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-2.159" x2="0" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="1.397" y1="-0.508" x2="1.397" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="1.397" y1="-3.048" x2="0" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="2.159" x2="0" y2="2.159" width="0.1524" layer="94"/>
<wire x1="0" y1="2.159" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="3.048" x2="1.397" y2="3.048" width="0.1524" layer="94"/>
<wire x1="1.397" y1="3.048" x2="1.397" y2="0.381" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.159" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<rectangle x1="-2.032" y1="1.397" x2="-1.524" y2="2.921" layer="94"/>
<rectangle x1="-2.032" y1="-0.762" x2="-1.524" y2="0.762" layer="94"/>
<rectangle x1="-2.032" y1="-2.921" x2="-1.524" y2="-1.397" layer="94"/>
<rectangle x1="0.762" y1="-0.635" x2="2.032" y2="-0.508" layer="94"/>
<pin name="D" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="S" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<polygon width="0.1016" layer="94">
<vertex x="-0.127" y="0"/>
<vertex x="-1.143" y="-0.635"/>
<vertex x="-1.143" y="0.635"/>
</polygon>
<polygon width="0.1016" layer="94">
<vertex x="1.397" y="-0.508"/>
<vertex x="0.762" y="0.508"/>
<vertex x="2.032" y="0.508"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="PMOSSOT23" prefix="T" uservalue="yes">
<description>&lt;b&gt;MOS FET&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="P_MOSFET" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="" package="SOT-23">
<connects>
<connect gate="A" pin="D" pad="1"/>
<connect gate="A" pin="G" pad="3"/>
<connect gate="A" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="linear">
<packages>
<package name="SO08">
<description>&lt;b&gt;Small Outline Package 8&lt;/b&gt;&lt;br&gt;
NS Package M08A</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-2.667" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.937" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.15" y1="-3.1" x2="-1.66" y2="-2" layer="51"/>
<rectangle x1="-0.88" y1="-3.1" x2="-0.39" y2="-2" layer="51"/>
<rectangle x1="0.39" y1="-3.1" x2="0.88" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="-3.1" x2="2.15" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="2" x2="2.15" y2="3.1" layer="51"/>
<rectangle x1="0.39" y1="2" x2="0.88" y2="3.1" layer="51"/>
<rectangle x1="-0.88" y1="2" x2="-0.39" y2="3.1" layer="51"/>
<rectangle x1="-2.15" y1="2" x2="-1.66" y2="3.1" layer="51"/>
</package>
<package name="MSOP08">
<description>&lt;b&gt;Mini Small Outline Package&lt;/b&gt;</description>
<wire x1="1.624" y1="1.299" x2="1.624" y2="-1.301" width="0.1524" layer="21"/>
<wire x1="-1.626" y1="-1.301" x2="-1.626" y2="1.299" width="0.1524" layer="21"/>
<wire x1="1.299" y1="1.624" x2="1.624" y2="1.299" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.626" y1="1.299" x2="-1.301" y2="1.624" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.626" y1="-1.301" x2="-1.301" y2="-1.626" width="0.1524" layer="21" curve="90"/>
<wire x1="1.299" y1="-1.626" x2="1.624" y2="-1.301" width="0.1524" layer="21" curve="90"/>
<wire x1="-1.341" y1="-1.626" x2="-1.204" y2="-1.626" width="0.1524" layer="21"/>
<wire x1="-0.747" y1="-1.626" x2="-0.554" y2="-1.626" width="0.1524" layer="21"/>
<wire x1="-0.097" y1="-1.626" x2="0.096" y2="-1.626" width="0.1524" layer="21"/>
<wire x1="0.553" y1="-1.626" x2="0.746" y2="-1.626" width="0.1524" layer="21"/>
<wire x1="1.203" y1="-1.626" x2="1.299" y2="-1.626" width="0.1524" layer="21"/>
<wire x1="-1.301" y1="1.624" x2="-1.204" y2="1.624" width="0.1524" layer="21"/>
<wire x1="-0.747" y1="1.624" x2="-0.554" y2="1.624" width="0.1524" layer="21"/>
<wire x1="-0.097" y1="1.624" x2="0.096" y2="1.624" width="0.1524" layer="21"/>
<wire x1="0.553" y1="1.624" x2="0.746" y2="1.624" width="0.1524" layer="21"/>
<wire x1="1.203" y1="1.624" x2="1.299" y2="1.624" width="0.1524" layer="21"/>
<circle x="-0.9456" y="-0.7906" radius="0.5" width="0.0508" layer="21"/>
<smd name="8" x="-0.976" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="7" x="-0.326" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="6" x="0.324" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="5" x="0.974" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="4" x="0.974" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="3" x="0.324" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="2" x="-0.326" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="1" x="-0.976" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<text x="-2.032" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.302" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.0975" y1="1.6244" x2="-0.8537" y2="2.3557" layer="51"/>
<rectangle x1="-0.4475" y1="1.6244" x2="-0.2037" y2="2.3557" layer="51"/>
<rectangle x1="0.2025" y1="1.6244" x2="0.4463" y2="2.3557" layer="51"/>
<rectangle x1="0.8525" y1="1.6244" x2="1.0963" y2="2.3557" layer="51"/>
<rectangle x1="-1.0975" y1="-2.3569" x2="-0.8537" y2="-1.6256" layer="51"/>
<rectangle x1="-0.4475" y1="-2.3569" x2="-0.2037" y2="-1.6256" layer="51"/>
<rectangle x1="0.2025" y1="-2.3569" x2="0.4463" y2="-1.6256" layer="51"/>
<rectangle x1="0.8525" y1="-2.3569" x2="1.0963" y2="-1.6256" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="OPAMP">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="3.175" x2="-3.81" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="-IN" x="-7.62" y="-2.54" visible="pad" length="short" direction="in"/>
<pin name="+IN" x="-7.62" y="2.54" visible="pad" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="pad" length="short" direction="out" rot="R180"/>
</symbol>
<symbol name="PWR+-">
<text x="1.27" y="3.175" size="0.8128" layer="93" rot="R90">V+</text>
<text x="1.27" y="-4.445" size="0.8128" layer="93" rot="R90">V-</text>
<pin name="V+" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="V-" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LMV358?*" prefix="IC">
<description>Dual &lt;b&gt;General Purpose, Low Voltage, Rail-to-Rail Output Operational Amplifiers&lt;/b&gt;&lt;p&gt;
Source: http://www.national.com/mpf/LM/LMV321.html&lt;br&gt;
http://www.national.com/dt/lmv_qual.pdf</description>
<gates>
<gate name="A" symbol="OPAMP" x="0" y="10.16"/>
<gate name="B" symbol="OPAMP" x="0" y="-10.16"/>
<gate name="P" symbol="PWR+-" x="0" y="10.16" addlevel="always"/>
</gates>
<devices>
<device name="M" package="SO08">
<connects>
<connect gate="A" pin="+IN" pad="3"/>
<connect gate="A" pin="-IN" pad="2"/>
<connect gate="A" pin="OUT" pad="1"/>
<connect gate="B" pin="+IN" pad="5"/>
<connect gate="B" pin="-IN" pad="6"/>
<connect gate="B" pin="OUT" pad="7"/>
<connect gate="P" pin="V+" pad="8"/>
<connect gate="P" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
<technology name="X"/>
</technologies>
</device>
<device name="MM" package="MSOP08">
<connects>
<connect gate="A" pin="+IN" pad="3"/>
<connect gate="A" pin="-IN" pad="2"/>
<connect gate="A" pin="OUT" pad="1"/>
<connect gate="B" pin="+IN" pad="5"/>
<connect gate="B" pin="-IN" pad="6"/>
<connect gate="B" pin="OUT" pad="7"/>
<connect gate="P" pin="V+" pad="8"/>
<connect gate="P" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
<technology name="X"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-DiscreteSemi">
<description>&lt;h3&gt;SparkFun Discrete Semiconductors&lt;/h3&gt;
This library contains diodes, optoisolators, TRIACs, MOSFETs, transistors, etc. 
&lt;br&gt;
&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is &lt;b&gt; the end user's responsibility&lt;/b&gt; to ensure correctness and suitablity for a given componet or application. 
&lt;br&gt;
&lt;br&gt;If you enjoy using this library, please buy one of our products at &lt;a href=" www.sparkfun.com"&gt;SparkFun.com&lt;/a&gt;.
&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;
&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="DPAK">
<wire x1="3.2766" y1="2.4654" x2="3.277" y2="-3.729" width="0.2032" layer="21"/>
<wire x1="3.277" y1="-3.729" x2="-3.277" y2="-3.729" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="-3.729" x2="-3.2766" y2="2.4654" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="2.465" x2="3.2774" y2="2.4646" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="2.567" x2="-2.5654" y2="3.2782" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.2782" x2="-2.1082" y2="3.7354" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="3.7354" x2="2.1082" y2="3.7354" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="3.7354" x2="2.5654" y2="3.2782" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.2782" x2="2.5654" y2="2.567" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="2.567" x2="-2.5654" y2="2.567" width="0.2032" layer="51"/>
<rectangle x1="-2.7178" y1="-6.7262" x2="-1.8542" y2="-3.8306" layer="51"/>
<rectangle x1="1.8542" y1="-6.7262" x2="2.7178" y2="-3.8306" layer="51"/>
<rectangle x1="-0.4318" y1="-4.5926" x2="0.4318" y2="-3.8306" layer="21"/>
<smd name="1" x="-2.28" y="-5.31" dx="1.6" dy="3" layer="1"/>
<smd name="3" x="2.28" y="-5.31" dx="1.6" dy="3" layer="1"/>
<smd name="4" x="0" y="1.588" dx="4.826" dy="5.715" layer="1"/>
<text x="-3.81" y="0" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="3.81" y="0" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="top-center">&gt;VALUE</text>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="2.567"/>
<vertex x="-2.5654" y="3.2782"/>
<vertex x="-2.1082" y="3.7354"/>
<vertex x="2.1082" y="3.7354"/>
<vertex x="2.5654" y="3.2782"/>
<vertex x="2.5654" y="2.567"/>
</polygon>
</package>
<package name="SOT323">
<wire x1="1.1224" y1="0.6604" x2="1.1224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.1224" y1="-0.6604" x2="-1.1224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.1224" y1="-0.6604" x2="-1.1224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.1224" y1="0.6604" x2="1.1224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-0.673" y1="0.7" x2="-1.1" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-1.1" y1="0.7" x2="-1.1" y2="-0.354" width="0.2032" layer="21"/>
<wire x1="0.673" y1="0.7" x2="1.1" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.1" y1="0.7" x2="1.1" y2="-0.354" width="0.2032" layer="21"/>
<smd name="1" x="-0.65" y="-0.925" dx="0.7" dy="0.7" layer="1"/>
<smd name="2" x="0.65" y="-0.925" dx="0.7" dy="0.7" layer="1"/>
<smd name="3" x="0" y="0.925" dx="0.7" dy="0.7" layer="1"/>
<text x="-1.27" y="0" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="1.27" y="0" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="top-center">&gt;VALUE</text>
</package>
<package name="TO220V">
<description>&lt;b&gt;TO 220 Vertical&lt;/b&gt; Package works with various parts including N-Channel MOSFET SparkFun SKU: COM-10213</description>
<wire x1="-5.08" y1="2.032" x2="-5.08" y2="-0.381" width="0.2032" layer="21"/>
<wire x1="5.08" y1="2.032" x2="5.08" y2="-0.381" width="0.2032" layer="21"/>
<wire x1="5.08" y1="2.032" x2="-5.08" y2="2.032" width="0.2032" layer="21"/>
<wire x1="-5.08" y1="2.032" x2="-5.08" y2="3.048" width="0.2032" layer="21"/>
<wire x1="-5.08" y1="3.048" x2="5.08" y2="3.048" width="0.2032" layer="21"/>
<wire x1="5.08" y1="3.048" x2="5.08" y2="2.032" width="0.2032" layer="21"/>
<wire x1="-5.08" y1="-0.381" x2="-4.191" y2="-1.27" width="0.2032" layer="21" curve="92.798868"/>
<wire x1="4.191" y1="-1.27" x2="5.08" y2="-0.381" width="0.2032" layer="21" curve="92.798868"/>
<wire x1="-4.191" y1="-1.27" x2="-3.81" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="4.191" y1="-1.27" x2="3.81" y2="-1.27" width="0.2032" layer="21"/>
<rectangle x1="-5.08" y1="2.032" x2="5.08" y2="3.048" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.334" y="0.254" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="5.334" y="0.254" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="top-center">&gt;VALUE</text>
</package>
<package name="SOT23-3">
<description>SOT23-3</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-0.8" y1="0.7" x2="-1.4" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="0.7" x2="-1.4" y2="-0.1" width="0.2032" layer="21"/>
<wire x1="0.8" y1="0.7" x2="1.4" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.4" y1="0.7" x2="1.4" y2="-0.1" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<smd name="3" x="0" y="1.1" dx="0.8" dy="0.9" layer="1"/>
<text x="-1.651" y="0" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="1.651" y="0" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="top-center">&gt;VALUE</text>
</package>
<package name="TO-263/D2PAK">
<wire x1="5" y1="-1" x2="5" y2="-3.4" width="0.2032" layer="21"/>
<wire x1="5" y1="-3.4" x2="-5" y2="-3.4" width="0.2032" layer="21"/>
<wire x1="-5" y1="-3.4" x2="-5" y2="-1" width="0.2032" layer="21"/>
<rectangle x1="-3.27" y1="-7.6" x2="-1.81" y2="-3.4" layer="51"/>
<rectangle x1="-0.73" y1="-4.9" x2="0.73" y2="-3.4" layer="21"/>
<smd name="1" x="-2.54" y="-7.045" dx="2.32" dy="3.81" layer="1"/>
<smd name="3" x="2.54" y="-7.045" dx="2.32" dy="3.81" layer="1"/>
<smd name="2" x="0" y="4.125" dx="11" dy="9.65" layer="1"/>
<text x="-5.715" y="0" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="5.715" y="0" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="top-center">&gt;VALUE</text>
<polygon width="0.1998" layer="51">
<vertex x="-5" y="6.25"/>
<vertex x="-5" y="7"/>
<vertex x="-1" y="7.65"/>
<vertex x="1" y="7.65"/>
<vertex x="5" y="7"/>
<vertex x="5" y="6.25"/>
</polygon>
<wire x1="-5" y1="6.25" x2="-5" y2="-0.65" width="0.127" layer="51"/>
<wire x1="5" y1="-0.65" x2="5" y2="6.25" width="0.127" layer="51"/>
<wire x1="-1.81" y1="-3.4" x2="-1.81" y2="-7.6" width="0.127" layer="51"/>
<wire x1="-1.81" y1="-7.6" x2="-3.27" y2="-7.6" width="0.127" layer="51"/>
<wire x1="-3.27" y1="-7.6" x2="-3.27" y2="-3.4" width="0.127" layer="51"/>
<wire x1="-3.27" y1="-3.4" x2="-1.81" y2="-3.4" width="0.127" layer="51"/>
<wire x1="1.81" y1="-3.4" x2="1.81" y2="-7.6" width="0.127" layer="51"/>
<wire x1="1.81" y1="-7.6" x2="3.27" y2="-7.6" width="0.127" layer="51"/>
<wire x1="3.27" y1="-7.6" x2="3.27" y2="-3.4" width="0.127" layer="51"/>
<wire x1="3.27" y1="-3.4" x2="1.81" y2="-3.4" width="0.127" layer="51"/>
<rectangle x1="1.81" y1="-7.6" x2="3.27" y2="-3.4" layer="51"/>
<rectangle x1="-3.27" y1="-4.9" x2="-1.81" y2="-3.4" layer="21"/>
<rectangle x1="1.81" y1="-4.9" x2="3.27" y2="-3.4" layer="21"/>
</package>
<package name="SO08">
<description>SOIC, 0.15 inch width</description>
<wire x1="2.3368" y1="1.9463" x2="-2.3368" y2="1.9463" width="0.2032" layer="21"/>
<wire x1="2.4368" y1="-1.9463" x2="2.7178" y2="-1.5653" width="0.2032" layer="21" curve="90"/>
<wire x1="-2.7178" y1="1.4653" x2="-2.3368" y2="1.9463" width="0.2032" layer="21" curve="-90.023829"/>
<wire x1="2.3368" y1="1.9463" x2="2.7178" y2="1.5653" width="0.2032" layer="21" curve="-90.030084"/>
<wire x1="-2.7178" y1="-1.6653" x2="-2.3368" y2="-1.9463" width="0.2032" layer="21" curve="90.060185"/>
<wire x1="-2.3368" y1="-1.9463" x2="2.4368" y2="-1.9463" width="0.2032" layer="21"/>
<wire x1="2.7178" y1="-1.5653" x2="2.7178" y2="1.5653" width="0.2032" layer="21"/>
<wire x1="-2.667" y1="0.6096" x2="-2.667" y2="-0.6604" width="0.2032" layer="21" curve="-180"/>
<wire x1="-2.7178" y1="1.4526" x2="-2.7178" y2="0.6096" width="0.2032" layer="21"/>
<wire x1="-2.7178" y1="-1.6653" x2="-2.7178" y2="-0.6604" width="0.2032" layer="21"/>
<rectangle x1="-2.159" y1="-3.302" x2="-1.651" y2="-2.2733" layer="51"/>
<rectangle x1="-0.889" y1="-3.302" x2="-0.381" y2="-2.2733" layer="51"/>
<rectangle x1="0.381" y1="-3.302" x2="0.889" y2="-2.2733" layer="51"/>
<rectangle x1="1.651" y1="-3.302" x2="2.159" y2="-2.2733" layer="51"/>
<rectangle x1="-0.889" y1="2.286" x2="-0.381" y2="3.302" layer="51"/>
<rectangle x1="0.381" y1="2.286" x2="0.889" y2="3.302" layer="51"/>
<rectangle x1="1.651" y1="2.286" x2="2.159" y2="3.302" layer="51"/>
<smd name="1" x="-1.905" y="-2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="2" x="-0.635" y="-2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="3" x="0.635" y="-2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="4" x="1.905" y="-2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="5" x="1.905" y="2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="6" x="0.635" y="2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="7" x="-0.635" y="2.8" dx="0.6" dy="1.2" layer="1"/>
<smd name="8" x="-1.905" y="2.8" dx="0.6" dy="1.2" layer="1"/>
<text x="-3.175" y="0" size="0.6096" layer="25" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="3.81" y="0" size="0.6096" layer="27" font="vector" ratio="20" rot="R90" align="bottom-center">&gt;VALUE</text>
<rectangle x1="-2.159" y1="2.286" x2="-1.651" y2="3.302" layer="51"/>
<polygon width="0.002540625" layer="21">
<vertex x="-2.69875" y="-2.38125" curve="90"/>
<vertex x="-3.01625" y="-2.06375" curve="90"/>
<vertex x="-3.33375" y="-2.38125" curve="90"/>
<vertex x="-3.01625" y="-2.69875" curve="90"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="LABELED-NMOS">
<description>&lt;h3&gt; N-channel MOSFET transistor&lt;/h3&gt;
Switches electronic signals</description>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="short"/>
<pin name="S" x="2.54" y="-5.08" visible="off" length="short" rot="R90"/>
<pin name="D" x="2.54" y="5.08" visible="off" length="short" rot="R270"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="0.6858" x2="-1.9812" y2="-0.8382" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="-1.2954" x2="-1.9812" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="-1.905" x2="-1.9812" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="2.54" x2="-1.9812" y2="1.8034" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="1.8034" x2="-1.9812" y2="1.0922" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.905" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="-1.2192" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-0.7112" x2="2.54" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="-1.9812" y1="1.8034" x2="2.54" y2="1.8034" width="0.1524" layer="94"/>
<wire x1="2.54" y1="1.8034" x2="2.54" y2="0.5588" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0.5588" x2="3.302" y2="0.5588" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0.5588" x2="1.778" y2="0.5588" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.8034" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="-1.905" width="0.1524" layer="94"/>
<polygon width="0.1524" layer="94">
<vertex x="1.778" y="-0.7112"/>
<vertex x="2.54" y="0.5588"/>
<vertex x="3.302" y="-0.7112"/>
</polygon>
<wire x1="3.302" y1="0.5588" x2="3.4798" y2="0.7366" width="0.1524" layer="94"/>
<wire x1="1.6002" y1="0.381" x2="1.778" y2="0.5588" width="0.1524" layer="94"/>
<polygon width="0.1524" layer="94">
<vertex x="-1.9812" y="0"/>
<vertex x="-1.2192" y="0.254"/>
<vertex x="-1.2192" y="-0.254"/>
</polygon>
<text x="5.08" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOSFET-NCH" prefix="Q">
<description>&lt;h3&gt;N-channel MOSFETs&lt;/h3&gt;
&lt;p&gt;Voltage controlled devices that allow control of high current outputs.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;SparkFun Products:&lt;/b&gt;
&lt;ul&gt;&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/13261”&gt;SparkFun OpenScale&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/12651”&gt;SparkFun Digital Sandbox&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/10182”&gt;SparkFun Monster Moto Shield&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/11214”&gt;SparkFun MOSFET Power Controller&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<gates>
<gate name="NMOS" symbol="LABELED-NMOS" x="0" y="0"/>
</gates>
<devices>
<device name="-FDD8780" package="DPAK">
<connects>
<connect gate="NMOS" pin="D" pad="4"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-09984"/>
<attribute name="VALUE" value="35A/25V/8.5mΩ"/>
</technology>
</technologies>
</device>
<device name="-2N7002PW" package="SOT323">
<connects>
<connect gate="NMOS" pin="D" pad="3"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-11151"/>
<attribute name="VALUE" value="310mA/60V/1.6Ω"/>
</technology>
</technologies>
</device>
<device name="-FQP30N06L" package="TO220V">
<connects>
<connect gate="NMOS" pin="D" pad="2"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-10060"/>
<attribute name="VALUE" value="60V/32A/35mΩ"/>
</technology>
</technologies>
</device>
<device name="-BSS138" package="SOT23-3">
<connects>
<connect gate="NMOS" pin="D" pad="3"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-00830"/>
<attribute name="VALUE" value="220mA/50V/3.5Ω"/>
</technology>
</technologies>
</device>
<device name="-PSMN7R0" package="TO-263/D2PAK">
<connects>
<connect gate="NMOS" pin="D" pad="2"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-12437"/>
<attribute name="VALUE" value="100A/100V/6.8mΩ"/>
</technology>
</technologies>
</device>
<device name="-AO3404A" package="SOT23-3">
<connects>
<connect gate="NMOS" pin="D" pad="3"/>
<connect gate="NMOS" pin="G" pad="1"/>
<connect gate="NMOS" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-12988"/>
<attribute name="VALUE" value="5.8A/30V/35mΩ"/>
</technology>
</technologies>
</device>
<device name="-FDS6630A" package="SO08">
<connects>
<connect gate="NMOS" pin="D" pad="5 6 7 8"/>
<connect gate="NMOS" pin="G" pad="4"/>
<connect gate="NMOS" pin="S" pad="1 2 3"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="TRANS-08089"/>
<attribute name="VALUE" value="6.5A/30V/38mΩ"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="10103594-0001LF">
<packages>
<package name="FCI_10103594-0001LF">
<text x="-4.36683125" y="4.316640625" size="0.501934375" layer="25">&gt;NAME</text>
<text x="-4.352690625" y="-2.601609375" size="0.5003125" layer="27">&gt;VALUE</text>
<wire x1="-2.725" y1="0.525" x2="-2.9" y2="0.25" width="0.01" layer="46" curve="90"/>
<wire x1="-2.9" y1="0.25" x2="-2.9" y2="-0.25" width="0.01" layer="46"/>
<wire x1="-2.9" y1="-0.25" x2="-2.725" y2="-0.525" width="0.01" layer="46" curve="90"/>
<wire x1="-2.725" y1="-0.525" x2="-2.55" y2="-0.25" width="0.01" layer="46" curve="90"/>
<wire x1="-2.55" y1="-0.25" x2="-2.55" y2="0.25" width="0.01" layer="46"/>
<wire x1="-2.55" y1="0.25" x2="-2.725" y2="0.525" width="0.01" layer="46" curve="90"/>
<wire x1="2.725" y1="0.525" x2="2.9" y2="0.25" width="0.01" layer="46" curve="-90"/>
<wire x1="2.9" y1="0.25" x2="2.9" y2="-0.25" width="0.01" layer="46"/>
<wire x1="2.9" y1="-0.25" x2="2.725" y2="-0.525" width="0.01" layer="46" curve="-90"/>
<wire x1="2.725" y1="-0.525" x2="2.55" y2="-0.25" width="0.01" layer="46" curve="-90"/>
<wire x1="2.55" y1="-0.25" x2="2.55" y2="0.25" width="0.01" layer="46"/>
<wire x1="2.55" y1="0.25" x2="2.725" y2="0.525" width="0.01" layer="46" curve="-90"/>
<polygon width="0" layer="1">
<vertex x="-2.725" y="0.605"/>
<vertex x="-2.725" y="1.35"/>
<vertex x="-2.075" y="1.35"/>
<vertex x="-2.075" y="-0.66" curve="-90"/>
<vertex x="-2.315" y="-0.9"/>
<vertex x="-2.725" y="-0.9"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="-2.725" y="-0.9"/>
<vertex x="-3.135" y="-0.9"/>
<vertex x="-3.145" y="-0.9" curve="-90"/>
<vertex x="-3.375" y="-0.67"/>
<vertex x="-3.375" y="1.12" curve="-90"/>
<vertex x="-3.145" y="1.35"/>
<vertex x="-3.14" y="1.35"/>
<vertex x="-2.725" y="1.35"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="-3.375" y="1.12"/>
<vertex x="-3.375" y="1.35"/>
<vertex x="-3.135" y="1.35"/>
<vertex x="-3.135" y="1.12"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="2.725" y="1.35"/>
<vertex x="3.375" y="1.35"/>
<vertex x="3.375" y="-0.66" curve="-90"/>
<vertex x="3.135" y="-0.9"/>
<vertex x="2.725" y="-0.9"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="2.725" y="-0.9"/>
<vertex x="2.315" y="-0.9"/>
<vertex x="2.305" y="-0.9" curve="-90"/>
<vertex x="2.075" y="-0.67"/>
<vertex x="2.075" y="1.12" curve="-90"/>
<vertex x="2.305" y="1.35"/>
<vertex x="2.31" y="1.35"/>
<vertex x="2.725" y="1.35"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="2.075" y="1.12"/>
<vertex x="2.075" y="1.35"/>
<vertex x="2.315" y="1.35"/>
<vertex x="2.315" y="1.12"/>
</polygon>
<rectangle x1="-3.48573125" y1="-1.00308125" x2="-1.975" y2="1.25" layer="29"/>
<rectangle x1="1.98043125" y1="-1.00275" x2="3.475" y2="1.25" layer="29"/>
<rectangle x1="-3.38121875" y1="-0.90165625" x2="-2.075" y2="1.35" layer="31"/>
<rectangle x1="2.07675" y1="-0.900759375" x2="3.375" y2="1.35" layer="31"/>
<wire x1="-2.425" y1="3.555" x2="-2.225" y2="3.23" width="0.01" layer="46" curve="-90"/>
<wire x1="-2.225" y1="3.23" x2="-2.225" y2="2.83" width="0.01" layer="46"/>
<wire x1="-2.225" y1="2.83" x2="-2.425" y2="2.505" width="0.01" layer="46" curve="-90"/>
<wire x1="-2.425" y1="2.505" x2="-2.625" y2="2.83" width="0.01" layer="46" curve="-90"/>
<wire x1="-2.625" y1="2.83" x2="-2.625" y2="3.23" width="0.01" layer="46"/>
<wire x1="-2.625" y1="3.23" x2="-2.425" y2="3.555" width="0.01" layer="46" curve="-90"/>
<wire x1="2.425" y1="3.555" x2="2.225" y2="3.23" width="0.01" layer="46" curve="90"/>
<wire x1="2.225" y1="3.23" x2="2.225" y2="2.83" width="0.01" layer="46"/>
<wire x1="2.225" y1="2.83" x2="2.425" y2="2.505" width="0.01" layer="46" curve="90"/>
<wire x1="2.425" y1="2.505" x2="2.625" y2="2.83" width="0.01" layer="46" curve="90"/>
<wire x1="2.625" y1="2.83" x2="2.625" y2="3.23" width="0.01" layer="46"/>
<wire x1="2.625" y1="3.23" x2="2.425" y2="3.555" width="0.01" layer="46" curve="90"/>
<polygon width="0" layer="1">
<vertex x="-2.425" y="3.56"/>
<vertex x="-2.425" y="3.76"/>
<vertex x="-1.9" y="3.76"/>
<vertex x="-1.9" y="2.3"/>
<vertex x="-2.425" y="2.3"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="-2.425" y="3.56"/>
<vertex x="-2.425" y="3.76"/>
<vertex x="-3.9" y="3.76"/>
<vertex x="-3.9" y="2.3"/>
<vertex x="-2.425" y="2.3"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="2.425" y="2.5"/>
<vertex x="2.425" y="2.3"/>
<vertex x="1.9" y="2.3"/>
<vertex x="1.9" y="3.76"/>
<vertex x="2.425" y="3.76"/>
</polygon>
<polygon width="0" layer="1">
<vertex x="2.425" y="2.3"/>
<vertex x="3.9" y="2.3"/>
<vertex x="3.9" y="3.76"/>
<vertex x="2.425" y="3.76"/>
</polygon>
<rectangle x1="-4.01205" y1="2.20663125" x2="-1.8" y2="3.85" layer="29"/>
<rectangle x1="1.8032" y1="2.20391875" x2="4" y2="3.85" layer="29"/>
<rectangle x1="-3.91033125" y1="2.306090625" x2="-1.9" y2="3.76" layer="31"/>
<rectangle x1="1.905540625" y1="2.306709375" x2="3.9" y2="3.76" layer="31"/>
<wire x1="-4.02" y1="-1.7" x2="4.02" y2="-1.7" width="0.127" layer="21"/>
<circle x="-1.7" y="4.1" radius="0.127" width="0" layer="21"/>
<smd name="1" x="-1.3" y="2.825" dx="1.75" dy="0.4" layer="1" rot="R90"/>
<smd name="2" x="-0.65" y="2.825" dx="1.75" dy="0.4" layer="1" rot="R90"/>
<smd name="3" x="0" y="2.825" dx="1.75" dy="0.4" layer="1" rot="R90"/>
<smd name="4" x="0.65" y="2.825" dx="1.75" dy="0.4" layer="1" rot="R90"/>
<smd name="5" x="1.3" y="2.825" dx="1.75" dy="0.4" layer="1" rot="R90"/>
<smd name="P5" x="-0.963" y="-0.25" dx="2.5" dy="1.425" layer="1" rot="R90"/>
<smd name="P6" x="0.963" y="-0.25" dx="2.5" dy="1.425" layer="1" rot="R90"/>
<smd name="P3" x="-2.9875" y="1.7" dx="1.825" dy="0.7" layer="1"/>
<smd name="P4" x="2.9875" y="1.7" dx="1.825" dy="0.7" layer="1"/>
<smd name="P1" x="-3.7" y="3" dx="0.1" dy="0.1" layer="1" stop="no" cream="no"/>
<smd name="P2" x="3.7" y="3" dx="0.1" dy="0.1" layer="1" stop="no" cream="no"/>
<smd name="P$1" x="-2.73115625" y="-0.0256" dx="1.75" dy="1.25" layer="16" rot="R90"/>
<smd name="P$2" x="2.726446875" y="-0.017775" dx="1.75" dy="1.25" layer="16" rot="R90"/>
<smd name="P$3" x="-2.422034375" y="3.111415625" dx="1.25" dy="1" layer="16" rot="R90"/>
<smd name="P$4" x="2.426896875" y="3.0782" dx="1.25" dy="1" layer="16" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="10103594-0001LF">
<wire x1="7.62" y1="7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.629540625" y="7.629540625" size="1.78021875" layer="95">&gt;NAME</text>
<text x="-7.62621875" y="-10.1683" size="1.77945" layer="96">&gt;VALUE</text>
<pin name="VCC" x="12.7" y="5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="D-" x="-12.7" y="2.54" length="middle"/>
<pin name="D+" x="-12.7" y="0" length="middle"/>
<pin name="ID" x="-12.7" y="-2.54" length="middle"/>
<pin name="GND" x="12.7" y="-5.08" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="10103594-0001LF" prefix="J">
<description>Conn Micro USB Type B RCP 5 POS 0.65mm Solder RA SMD 5 Terminal 1 Port T/R</description>
<gates>
<gate name="G$1" symbol="10103594-0001LF" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FCI_10103594-0001LF">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="5 P1 P2 P3 P4 P5 P6"/>
<connect gate="G$1" pin="ID" pad="4"/>
<connect gate="G$1" pin="VCC" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Good"/>
<attribute name="DESCRIPTION" value=" Conn Micro USB Type B RCP 5 POS 0.65mm Solder RA SMD 5 Terminal 1 Port T/R "/>
<attribute name="MF" value="FCI"/>
<attribute name="MP" value="10103594-0001LF"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="0.40 USD"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
<class number="3" name="usbvcc" width="0.3048" drill="0.4826">
<clearance class="3" value="0.2032"/>
</class>
</classes>
<parts>
<part name="U$1" library="Heep" deviceset="SILVERTEL_POE" device="MICRO"/>
<part name="C1" library="microbuilder" deviceset="CAP_CERAMIC" device="_0805MP" value="10uF"/>
<part name="C2" library="microbuilder" deviceset="CAP_ELECTROLYTIC" device="PANASONIC_D" value="100uF 25V"/>
<part name="U$2" library="microbuilder" deviceset="GND" device=""/>
<part name="U4" library="W5500" deviceset="W5500" device=""/>
<part name="C21" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="4.7uF"/>
<part name="C22" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.01uF"/>
<part name="GND19" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="R12" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="12.4k"/>
<part name="GND20" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="C23" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.1uF"/>
<part name="C24" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="10uF"/>
<part name="GND21" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="L2" library="SparkFun-Passives" deviceset="INDUCTOR" device="0603" value="1uH"/>
<part name="C25" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="10uF"/>
<part name="U$6" library="SparkFun-Aesthetics" deviceset="VCCA" device=""/>
<part name="C33" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="10uF"/>
<part name="GND22" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="U$7" library="SparkFun-Aesthetics" deviceset="VCCA" device=""/>
<part name="GND23" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="U$8" library="SparkFun-Aesthetics" deviceset="VCCA" device=""/>
<part name="GND7" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="C35" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="8pF"/>
<part name="C36" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="8pF"/>
<part name="GND26" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="R19" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="51"/>
<part name="R20" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="51"/>
<part name="C37" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.1uF"/>
<part name="U$9" library="SparkFun-Aesthetics" deviceset="VCCA" device=""/>
<part name="GND29" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="C38" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="6.8nF"/>
<part name="C39" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="6.8nF"/>
<part name="C40" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.01uF"/>
<part name="R21" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="51"/>
<part name="R22" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="51"/>
<part name="GND30" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND33" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="25MHZ" library="SparkFun-Clocks" deviceset="CRYSTAL-GROUNDED" device="SMD-3.2X2.5"/>
<part name="GND36" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="C9" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.1uF"/>
<part name="C10" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.1uF"/>
<part name="C11" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="0.1uF"/>
<part name="R1" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="330"/>
<part name="R2" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="330"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="IC2" library="microbuilder" deviceset="ATMEGA32U4" device="-MU" value="ATMEGA32U4-MU"/>
<part name="Y4" library="SparkFun" deviceset="RESONATOR" device="SMD" value="8MHz"/>
<part name="R3" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="R4" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="22"/>
<part name="R5" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="22"/>
<part name="C3" library="SparkFun-Passives" deviceset="CAP" device="0603-CAP" value="10uF"/>
<part name="C6" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="10µF"/>
<part name="C7" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="1uF"/>
<part name="U$27" library="microbuilder" deviceset="GND" device=""/>
<part name="U$28" library="microbuilder" deviceset="GND" device=""/>
<part name="C8" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="10µF"/>
<part name="U$29" library="microbuilder" deviceset="GND" device=""/>
<part name="U$30" library="microbuilder" deviceset="GND" device=""/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="U2" library="microbuilder" deviceset="VREG_SOT23-5" device="" value="SPX3819-3.3"/>
<part name="U$4" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$11" library="SparkFun-PowerSymbols" deviceset="VCC-ISO" device=""/>
<part name="+3V8" library="supply1" deviceset="+3V3" device=""/>
<part name="H4" library="holes" deviceset="MOUNT-HOLE" device="3.2"/>
<part name="H1" library="holes" deviceset="MOUNT-HOLE" device="3.2"/>
<part name="H2" library="holes" deviceset="MOUNT-HOLE" device="3.2"/>
<part name="H3" library="holes" deviceset="MOUNT-HOLE" device="3.2"/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V7" library="supply1" deviceset="+3V3" device=""/>
<part name="R7" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V9" library="supply1" deviceset="+3V3" device=""/>
<part name="J2" library="adafruit" library_urn="urn:adsk.eagle:library:420" deviceset="1X2" device="-3.5MM"/>
<part name="J3" library="adafruit" library_urn="urn:adsk.eagle:library:420" deviceset="1X2" device="-3.5MM"/>
<part name="J4" library="adafruit" library_urn="urn:adsk.eagle:library:420" deviceset="1X2" device="-3.5MM"/>
<part name="J5" library="adafruit" library_urn="urn:adsk.eagle:library:420" deviceset="1X2" device="-3.5MM"/>
<part name="D1" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE"/>
<part name="D2" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE"/>
<part name="D3" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE"/>
<part name="D4" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE"/>
<part name="GND1" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND2" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND3" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND4" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND5" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND6" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND8" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="GND9" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="+3V10" library="supply1" deviceset="+3V3" device=""/>
<part name="R8" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="U$5" library="microbuilder" deviceset="VBUS" device=""/>
<part name="U$10" library="microbuilder" deviceset="VBUS" device=""/>
<part name="SW1" library="adafruit" deviceset="SPST_TACT" device="-KMR2"/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="T1" library="zetex" deviceset="PMOSSOT23" device="" value="DMG3415U"/>
<part name="GND50" library="supply1" deviceset="GND" device=""/>
<part name="GND51" library="supply1" deviceset="GND" device=""/>
<part name="P+9" library="supply1" deviceset="+5V" device=""/>
<part name="P+10" library="supply1" deviceset="+5V" device=""/>
<part name="R13" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="R14" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="U$32" library="microbuilder" deviceset="3.3V" device=""/>
<part name="U3" library="linear" deviceset="LMV358?*" device="MM" technology="X" value="LMV358IDGKR"/>
<part name="U$33" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$21" library="microbuilder" deviceset="VBUS" device=""/>
<part name="U$34" library="microbuilder" deviceset="VBAT" device=""/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="Q1" library="SparkFun-DiscreteSemi" deviceset="MOSFET-NCH" device="-FDD8780" value="35A/25V/8.5mΩ"/>
<part name="Q3" library="SparkFun-DiscreteSemi" deviceset="MOSFET-NCH" device="-FDD8780" value="35A/25V/8.5mΩ"/>
<part name="Q5" library="SparkFun-DiscreteSemi" deviceset="MOSFET-NCH" device="-FDD8780" value="35A/25V/8.5mΩ"/>
<part name="Q6" library="SparkFun-DiscreteSemi" deviceset="MOSFET-NCH" device="-FDD8780" value="35A/25V/8.5mΩ"/>
<part name="X2" library="Heep" deviceset="J1011F" device="HANRUN"/>
<part name="J6" library="10103594-0001LF" deviceset="10103594-0001LF" device=""/>
<part name="J7" library="SparkFun-Connectors" deviceset="CONN_03X2" device="NO_SILK"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="R6" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="R9" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="R10" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="R11" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="10K"/>
<part name="R15" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="1K"/>
<part name="R16" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="1K"/>
<part name="R17" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="1K"/>
<part name="R18" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="1K"/>
<part name="GND16" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="U$3" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$12" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$13" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$14" library="microbuilder" deviceset="VBAT" device=""/>
<part name="R23" library="SparkFun-Passives" deviceset="RESISTOR" device="0603-RES" value="1K"/>
<part name="D5" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE"/>
<part name="GND17" library="SparkFun-Aesthetics" deviceset="GND" device=""/>
<part name="U$16" library="Heep" deviceset="AG5200" device="AG5300"/>
<part name="U$17" library="microbuilder" deviceset="GND" device=""/>
<part name="U$18" library="microbuilder" deviceset="VBAT" device=""/>
<part name="C5" library="SparkFun-Passives" deviceset="CAP_POL" device="G" value="470uF 25V"/>
<part name="+3V5" library="supply1" deviceset="+3V3" device=""/>
<part name="P+2" library="supply1" deviceset="+5V" device=""/>
<part name="U$19" library="Heep" deviceset="BUCK_CONVERTER" device=""/>
<part name="C4" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="10µF 25V"/>
<part name="U$20" library="microbuilder" deviceset="GND" device=""/>
<part name="U$22" library="microbuilder" deviceset="GND" device=""/>
<part name="U$23" library="microbuilder" deviceset="GND" device=""/>
<part name="C12" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="22uF 10V"/>
<part name="C13" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="22uF 10V"/>
<part name="L1" library="microbuilder" deviceset="INDUCTOR" device="TDK_VLC5045" value="4.7uH"/>
<part name="C14" library="microbuilder" deviceset="CAP_CERAMIC" device="0603MINI" value="22nF"/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="U$24" library="microbuilder" deviceset="GND" device=""/>
<part name="U$25" library="microbuilder" deviceset="GND" device=""/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="J1" library="SparkFun-Connectors" deviceset="CONN_01" device=""/>
<part name="J8" library="SparkFun-Connectors" deviceset="CONN_01" device=""/>
<part name="J9" library="SparkFun-Connectors" deviceset="CONN_01" device=""/>
<part name="J10" library="SparkFun-Connectors" deviceset="CONN_01" device=""/>
<part name="J11" library="SparkFun-Connectors" deviceset="CONN_04" device=""/>
<part name="J12" library="SparkFun-Connectors" deviceset="CONN_04" device=""/>
<part name="J13" library="SparkFun-Connectors" deviceset="CONN_04" device="1X04_NO_SILK"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="+3V13" library="supply1" deviceset="+3V3" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="142.24" y="170.18" size="5.08" layer="97">W5500 Subsystem</text>
<text x="246.38" y="86.36" size="2.54" layer="97">W5500 VCCA Filter</text>
<wire x1="309.88" y1="254" x2="187.96" y2="254" width="0.1524" layer="94" style="shortdash"/>
<text x="55.88" y="261.62" size="1.778" layer="94">POWER AND FILTERING</text>
<text x="17.78" y="264.16" size="1.778" layer="94">VBAT = PoE V+</text>
<text x="149.86" y="261.62" size="1.778" layer="94">VOLTAGE SELECT
(3.3V DEFAULT)</text>
<text x="33.02" y="104.14" size="2.54" layer="97">PoE Ethernet Jack</text>
<text x="228.6" y="350.52" size="5.08" layer="97">ATMEGA32U4</text>
<text x="251.46" y="218.44" size="1.778" layer="94">ICSP HEADER</text>
<text x="-50.8" y="332.74" size="2.54" layer="94" ratio="15" align="center">POWER SUPPLY: 5V</text>
<text x="-50.8" y="251.46" size="2.54" layer="94" ratio="15" align="center">POWER SUPPLY SELECTION</text>
<text x="-73.66" y="320.04" size="1.778" layer="97">VBAT is POE Voltage</text>
<text x="-88.9" y="254" size="1.778" layer="97">VBAT is POE Voltage</text>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="73.66" y="48.26"/>
<instance part="C1" gate="G$1" x="96.52" y="58.42" rot="R180"/>
<instance part="C2" gate="G$1" x="104.14" y="55.88"/>
<instance part="U$2" gate="G$1" x="109.22" y="50.8"/>
<instance part="U4" gate="G$1" x="160.02" y="121.92"/>
<instance part="C21" gate="G$1" x="162.56" y="76.2"/>
<instance part="C22" gate="G$1" x="167.64" y="68.58"/>
<instance part="GND19" gate="1" x="165.1" y="63.5"/>
<instance part="R12" gate="G$1" x="114.3" y="96.52" rot="R90"/>
<instance part="GND20" gate="1" x="114.3" y="86.36"/>
<instance part="C23" gate="G$1" x="208.28" y="96.52"/>
<instance part="C24" gate="G$1" x="223.52" y="96.52"/>
<instance part="GND21" gate="1" x="208.28" y="88.9"/>
<instance part="L2" gate="G$1" x="205.74" y="78.74" rot="R90"/>
<instance part="C25" gate="G$1" x="220.98" y="68.58"/>
<instance part="U$6" gate="G$1" x="294.64" y="83.82"/>
<instance part="C33" gate="G$1" x="185.42" y="68.58"/>
<instance part="GND22" gate="1" x="121.92" y="101.6"/>
<instance part="U$7" gate="G$1" x="106.68" y="132.08"/>
<instance part="GND23" gate="1" x="152.4" y="71.12"/>
<instance part="U$8" gate="G$1" x="129.54" y="86.36"/>
<instance part="GND7" gate="1" x="137.16" y="154.94"/>
<instance part="C35" gate="G$1" x="254" y="121.92" rot="R90"/>
<instance part="C36" gate="G$1" x="254" y="109.22" rot="R90"/>
<instance part="GND26" gate="1" x="266.7" y="104.14"/>
<instance part="R19" gate="G$1" x="162.56" y="48.26" rot="R90"/>
<instance part="R20" gate="G$1" x="149.86" y="48.26" rot="R90"/>
<instance part="C37" gate="G$1" x="137.16" y="45.72"/>
<instance part="U$9" gate="G$1" x="137.16" y="58.42"/>
<instance part="GND29" gate="1" x="137.16" y="38.1"/>
<instance part="C38" gate="G$1" x="160.02" y="27.94" rot="R90"/>
<instance part="C39" gate="G$1" x="160.02" y="17.78" rot="R90"/>
<instance part="C40" gate="G$1" x="142.24" y="2.54"/>
<instance part="R21" gate="G$1" x="127" y="15.24" rot="R90"/>
<instance part="R22" gate="G$1" x="139.7" y="15.24" rot="R90"/>
<instance part="GND30" gate="1" x="142.24" y="-5.08"/>
<instance part="GND33" gate="1" x="210.82" y="58.42"/>
<instance part="25MHZ" gate="G$1" x="236.22" y="116.84" rot="R90"/>
<instance part="GND36" gate="1" x="246.38" y="116.84" rot="R90"/>
<instance part="C9" gate="G$1" x="243.84" y="68.58"/>
<instance part="C10" gate="G$1" x="233.68" y="68.58"/>
<instance part="C11" gate="G$1" x="195.58" y="68.58"/>
<instance part="R1" gate="G$1" x="60.96" y="71.12" rot="R180"/>
<instance part="R2" gate="G$1" x="60.96" y="81.28" rot="R180"/>
<instance part="GND12" gate="1" x="182.88" y="314.96" rot="R270"/>
<instance part="GND13" gate="1" x="238.76" y="261.62" rot="R270"/>
<instance part="GND14" gate="1" x="220.98" y="292.1"/>
<instance part="GND15" gate="1" x="220.98" y="281.94" rot="R270"/>
<instance part="IC2" gate="G$1" x="264.16" y="289.56"/>
<instance part="Y4" gate="G$1" x="233.68" y="281.94" rot="R270"/>
<instance part="R3" gate="G$1" x="198.12" y="139.7" rot="R90"/>
<instance part="R4" gate="G$1" x="223.52" y="309.88" rot="R180"/>
<instance part="R5" gate="G$1" x="218.44" y="307.34" rot="R180"/>
<instance part="C3" gate="G$1" x="220.98" y="297.18"/>
<instance part="C6" gate="G$1" x="25.4" y="228.6"/>
<instance part="C7" gate="G$1" x="68.58" y="228.6"/>
<instance part="U$27" gate="G$1" x="25.4" y="220.98"/>
<instance part="U$28" gate="G$1" x="68.58" y="220.98"/>
<instance part="C8" gate="G$1" x="60.96" y="228.6"/>
<instance part="U$29" gate="G$1" x="60.96" y="220.98"/>
<instance part="U$30" gate="G$1" x="38.1" y="220.98"/>
<instance part="+3V4" gate="G$1" x="68.58" y="246.38" rot="MR0"/>
<instance part="U2" gate="G$1" x="48.26" y="238.76"/>
<instance part="U$4" gate="G$1" x="109.22" y="63.5"/>
<instance part="U$11" gate="G$1" x="157.48" y="238.76" rot="R180"/>
<instance part="+3V8" gate="G$1" x="165.1" y="243.84" rot="R270"/>
<instance part="H4" gate="G$1" x="386.08" y="91.44"/>
<instance part="H1" gate="G$1" x="386.08" y="96.52"/>
<instance part="H2" gate="G$1" x="386.08" y="101.6"/>
<instance part="H3" gate="G$1" x="386.08" y="86.36"/>
<instance part="+3V6" gate="G$1" x="223.52" y="109.22" rot="MR0"/>
<instance part="+3V7" gate="G$1" x="185.42" y="86.36" rot="MR0"/>
<instance part="R7" gate="G$1" x="309.88" y="281.94" rot="R180"/>
<instance part="+3V1" gate="G$1" x="317.5" y="281.94" rot="R270"/>
<instance part="+3V2" gate="G$1" x="312.42" y="314.96" rot="R270"/>
<instance part="+3V9" gate="G$1" x="228.6" y="322.58"/>
<instance part="J2" gate="G$1" x="347.98" y="172.72"/>
<instance part="J3" gate="G$1" x="347.98" y="157.48"/>
<instance part="J4" gate="G$1" x="347.98" y="142.24"/>
<instance part="J5" gate="G$1" x="347.98" y="127"/>
<instance part="D1" gate="G$1" x="317.5" y="180.34"/>
<instance part="D2" gate="G$1" x="317.5" y="165.1"/>
<instance part="D3" gate="G$1" x="317.5" y="149.86"/>
<instance part="D4" gate="G$1" x="317.5" y="134.62"/>
<instance part="GND1" gate="1" x="332.74" y="134.62" rot="R90"/>
<instance part="GND2" gate="1" x="332.74" y="149.86" rot="R90"/>
<instance part="GND3" gate="1" x="332.74" y="165.1" rot="R90"/>
<instance part="GND4" gate="1" x="332.74" y="180.34" rot="R90"/>
<instance part="GND5" gate="1" x="292.1" y="170.18" rot="R270"/>
<instance part="GND6" gate="1" x="292.1" y="154.94" rot="R270"/>
<instance part="GND8" gate="1" x="292.1" y="139.7" rot="R270"/>
<instance part="GND9" gate="1" x="292.1" y="124.46" rot="R270"/>
<instance part="+3V10" gate="G$1" x="233.68" y="304.8"/>
<instance part="R8" gate="G$1" x="177.8" y="154.94" rot="R90"/>
<instance part="+3V3" gate="G$1" x="198.12" y="152.4" rot="MR0"/>
<instance part="U$5" gate="G$1" x="182.88" y="304.8" rot="R90"/>
<instance part="U$10" gate="G$1" x="231.14" y="332.74"/>
<instance part="SW1" gate="G$1" x="213.36" y="340.36" rot="R270"/>
<instance part="GND34" gate="1" x="205.74" y="340.36" rot="R270"/>
<instance part="T1" gate="A" x="-35.56" y="198.12" rot="MR270"/>
<instance part="GND50" gate="1" x="-68.58" y="210.82"/>
<instance part="GND51" gate="1" x="-48.26" y="210.82"/>
<instance part="P+9" gate="1" x="-48.26" y="241.3" smashed="yes">
<attribute name="VALUE" x="-46.355" y="243.84" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="P+10" gate="1" x="-20.32" y="203.2" smashed="yes">
<attribute name="VALUE" x="-18.415" y="205.74" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="R13" gate="G$1" x="-68.58" y="236.22" rot="R90"/>
<instance part="R14" gate="G$1" x="-68.58" y="220.98" rot="R90"/>
<instance part="U$32" gate="G$1" x="-58.42" y="226.06"/>
<instance part="U3" gate="A" x="-48.26" y="226.06"/>
<instance part="U3" gate="P" x="-48.26" y="226.06"/>
<instance part="U$33" gate="G$1" x="-58.42" y="314.96"/>
<instance part="U$21" gate="G$1" x="-55.88" y="200.66"/>
<instance part="U$34" gate="G$1" x="-78.74" y="248.92"/>
<instance part="P+1" gate="1" x="25.4" y="259.08" smashed="yes">
<attribute name="VALUE" x="27.305" y="261.62" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="Q1" gate="NMOS" x="309.88" y="175.26" smashed="yes" rot="R270"/>
<instance part="Q3" gate="NMOS" x="309.88" y="160.02" smashed="yes" rot="R270"/>
<instance part="Q5" gate="NMOS" x="309.88" y="144.78" smashed="yes" rot="R270"/>
<instance part="Q6" gate="NMOS" x="309.88" y="129.54" smashed="yes" rot="R270"/>
<instance part="X2" gate="G$1" x="30.48" y="33.02" rot="R180"/>
<instance part="J6" gate="G$1" x="198.12" y="309.88" smashed="yes" rot="R180">
<attribute name="NAME" x="205.749540625" y="302.250459375" size="1.78021875" layer="95" rot="R180"/>
</instance>
<instance part="J7" gate="G$1" x="259.08" y="208.28"/>
<instance part="GND11" gate="1" x="266.7" y="203.2"/>
<instance part="R6" gate="G$1" x="299.72" y="129.54" rot="R90"/>
<instance part="R9" gate="G$1" x="299.72" y="144.78" rot="R90"/>
<instance part="R10" gate="G$1" x="299.72" y="160.02" rot="R90"/>
<instance part="R11" gate="G$1" x="299.72" y="175.26" rot="R90"/>
<instance part="R15" gate="G$1" x="325.12" y="180.34" rot="R180"/>
<instance part="R16" gate="G$1" x="325.12" y="165.1" rot="R180"/>
<instance part="R17" gate="G$1" x="325.12" y="149.86" rot="R180"/>
<instance part="R18" gate="G$1" x="325.12" y="134.62" rot="R180"/>
<instance part="GND16" gate="1" x="177.8" y="162.56" rot="R180"/>
<instance part="U$3" gate="G$1" x="342.9" y="177.8"/>
<instance part="U$12" gate="G$1" x="342.9" y="162.56"/>
<instance part="U$13" gate="G$1" x="342.9" y="147.32"/>
<instance part="U$14" gate="G$1" x="342.9" y="132.08"/>
<instance part="R23" gate="G$1" x="317.5" y="106.68" rot="R180"/>
<instance part="D5" gate="G$1" x="307.34" y="106.68"/>
<instance part="GND17" gate="1" x="325.12" y="106.68" rot="R90"/>
<instance part="U$16" gate="G$1" x="78.74" y="27.94"/>
<instance part="U$17" gate="G$1" x="101.6" y="20.32"/>
<instance part="U$18" gate="G$1" x="101.6" y="33.02"/>
<instance part="C5" gate="G$1" x="93.98" y="27.94"/>
<instance part="+3V5" gate="G$1" x="66.04" y="88.9" rot="MR0"/>
<instance part="P+2" gate="1" x="266.7" y="215.9" smashed="yes">
<attribute name="VALUE" x="268.605" y="218.44" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$19" gate="G$1" x="-27.94" y="302.26"/>
<instance part="C4" gate="G$1" x="-50.8" y="304.8"/>
<instance part="U$20" gate="G$1" x="-50.8" y="294.64"/>
<instance part="U$22" gate="G$1" x="-30.48" y="287.02"/>
<instance part="U$23" gate="G$1" x="-25.4" y="287.02"/>
<instance part="C12" gate="G$1" x="0" y="302.26"/>
<instance part="C13" gate="G$1" x="7.62" y="302.26"/>
<instance part="L1" gate="G$1" x="-7.62" y="307.34"/>
<instance part="C14" gate="G$1" x="-15.24" y="312.42" rot="R90"/>
<instance part="P+3" gate="1" x="17.78" y="307.34" smashed="yes" rot="R270">
<attribute name="VALUE" x="17.78" y="309.245" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="U$24" gate="G$1" x="0" y="297.18"/>
<instance part="U$25" gate="G$1" x="7.62" y="297.18"/>
<instance part="P+4" gate="1" x="-15.24" y="302.26" smashed="yes" rot="R270">
<attribute name="VALUE" x="-15.24" y="304.165" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="J1" gate="G$1" x="276.86" y="180.34"/>
<instance part="J8" gate="G$1" x="276.86" y="165.1"/>
<instance part="J9" gate="G$1" x="276.86" y="149.86"/>
<instance part="J10" gate="G$1" x="276.86" y="134.62"/>
<instance part="J11" gate="G$1" x="375.92" y="45.72" rot="R180"/>
<instance part="J12" gate="G$1" x="375.92" y="25.4" rot="R180"/>
<instance part="J13" gate="G$1" x="327.66" y="48.26" rot="R180"/>
<instance part="GND10" gate="1" x="370.84" y="38.1"/>
<instance part="+3V13" gate="G$1" x="370.84" y="17.78" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="45.72" y1="66.04" x2="58.42" y2="66.04" width="0.1524" layer="91"/>
<wire x1="58.42" y1="66.04" x2="68.58" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VIN-"/>
<pinref part="X2" gate="G$1" pin="POE-"/>
<pinref part="U$16" gate="G$1" pin="VIN-"/>
<wire x1="68.58" y1="20.32" x2="58.42" y2="20.32" width="0.1524" layer="91"/>
<wire x1="58.42" y1="20.32" x2="58.42" y2="66.04" width="0.1524" layer="91"/>
<junction x="58.42" y="66.04"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VIN+"/>
<wire x1="45.72" y1="60.96" x2="63.5" y2="60.96" width="0.1524" layer="91"/>
<wire x1="63.5" y1="60.96" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
<wire x1="68.58" y1="60.96" x2="68.58" y2="66.04" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="POE+"/>
<wire x1="63.5" y1="60.96" x2="63.5" y2="35.56" width="0.1524" layer="91"/>
<junction x="63.5" y="60.96"/>
<pinref part="U$16" gate="G$1" pin="VIN+"/>
<wire x1="63.5" y1="35.56" x2="68.58" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="-VDC"/>
<wire x1="88.9" y1="55.88" x2="88.9" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="88.9" y1="53.34" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="-"/>
<wire x1="96.52" y1="53.34" x2="104.14" y2="53.34" width="0.1524" layer="91"/>
<junction x="96.52" y="53.34"/>
<wire x1="104.14" y1="53.34" x2="109.22" y2="53.34" width="0.1524" layer="91"/>
<junction x="104.14" y="53.34"/>
<pinref part="U$2" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="162.56" y1="73.66" x2="162.56" y2="66.04" width="0.1524" layer="91"/>
<wire x1="162.56" y1="66.04" x2="165.1" y2="66.04" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="165.1" y1="66.04" x2="167.64" y2="66.04" width="0.1524" layer="91"/>
<pinref part="GND19" gate="1" pin="GND"/>
<junction x="165.1" y="66.04"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="114.3" y1="91.44" x2="114.3" y2="88.9" width="0.1524" layer="91"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="208.28" y1="91.44" x2="223.52" y2="91.44" width="0.1524" layer="91"/>
<pinref part="GND21" gate="1" pin="GND"/>
<junction x="208.28" y="91.44"/>
<pinref part="C24" gate="G$1" pin="2"/>
<wire x1="223.52" y1="91.44" x2="223.52" y2="93.98" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="208.28" y1="93.98" x2="208.28" y2="91.44" width="0.1524" layer="91"/>
<wire x1="208.28" y1="91.44" x2="193.04" y2="91.44" width="0.1524" layer="91"/>
<wire x1="193.04" y1="91.44" x2="193.04" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="GND"/>
<wire x1="193.04" y1="116.84" x2="187.96" y2="116.84" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="AGND@1"/>
<wire x1="129.54" y1="129.54" x2="121.92" y2="129.54" width="0.1524" layer="91"/>
<wire x1="121.92" y1="129.54" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="AGND@2"/>
<wire x1="121.92" y1="114.3" x2="121.92" y2="104.14" width="0.1524" layer="91"/>
<wire x1="129.54" y1="114.3" x2="121.92" y2="114.3" width="0.1524" layer="91"/>
<junction x="121.92" y="114.3"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="AGND@5"/>
<wire x1="160.02" y1="91.44" x2="160.02" y2="78.74" width="0.1524" layer="91"/>
<wire x1="160.02" y1="78.74" x2="152.4" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="AGND@4"/>
<wire x1="152.4" y1="91.44" x2="152.4" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="AGND@3"/>
<wire x1="147.32" y1="91.44" x2="147.32" y2="78.74" width="0.1524" layer="91"/>
<wire x1="147.32" y1="78.74" x2="152.4" y2="78.74" width="0.1524" layer="91"/>
<junction x="152.4" y="78.74"/>
<wire x1="152.4" y1="78.74" x2="152.4" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND23" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="AGND@6"/>
<wire x1="144.78" y1="149.86" x2="144.78" y2="157.48" width="0.1524" layer="91"/>
<wire x1="144.78" y1="157.48" x2="137.16" y2="157.48" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="2"/>
<wire x1="256.54" y1="109.22" x2="266.7" y2="109.22" width="0.1524" layer="91"/>
<wire x1="266.7" y1="109.22" x2="266.7" y2="106.68" width="0.1524" layer="91"/>
<pinref part="C35" gate="G$1" pin="2"/>
<wire x1="256.54" y1="121.92" x2="266.7" y2="121.92" width="0.1524" layer="91"/>
<wire x1="266.7" y1="121.92" x2="266.7" y2="109.22" width="0.1524" layer="91"/>
<junction x="266.7" y="109.22"/>
<pinref part="GND26" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="2"/>
<wire x1="137.16" y1="43.18" x2="137.16" y2="40.64" width="0.1524" layer="91"/>
<pinref part="GND29" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C40" gate="G$1" pin="2"/>
<pinref part="GND30" gate="1" pin="GND"/>
<wire x1="142.24" y1="0" x2="142.24" y2="-2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="2"/>
<wire x1="220.98" y1="60.96" x2="220.98" y2="66.04" width="0.1524" layer="91"/>
<wire x1="220.98" y1="60.96" x2="233.68" y2="60.96" width="0.1524" layer="91"/>
<wire x1="233.68" y1="60.96" x2="233.68" y2="66.04" width="0.1524" layer="91"/>
<wire x1="233.68" y1="60.96" x2="243.84" y2="60.96" width="0.1524" layer="91"/>
<wire x1="243.84" y1="60.96" x2="243.84" y2="66.04" width="0.1524" layer="91"/>
<junction x="233.68" y="60.96"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="185.42" y1="66.04" x2="185.42" y2="60.96" width="0.1524" layer="91"/>
<wire x1="185.42" y1="60.96" x2="195.58" y2="60.96" width="0.1524" layer="91"/>
<junction x="220.98" y="60.96"/>
<wire x1="195.58" y1="60.96" x2="210.82" y2="60.96" width="0.1524" layer="91"/>
<wire x1="210.82" y1="60.96" x2="220.98" y2="60.96" width="0.1524" layer="91"/>
<wire x1="195.58" y1="66.04" x2="195.58" y2="60.96" width="0.1524" layer="91"/>
<junction x="195.58" y="60.96"/>
<pinref part="GND33" gate="1" pin="GND"/>
<junction x="210.82" y="60.96"/>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="C11" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="25MHZ" gate="G$1" pin="3"/>
<pinref part="GND36" gate="1" pin="GND"/>
<wire x1="243.84" y1="116.84" x2="241.3" y2="116.84" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="241.3" y1="271.78" x2="241.3" y2="266.7" width="0.1524" layer="91"/>
<wire x1="241.3" y1="266.7" x2="241.3" y2="264.16" width="0.1524" layer="91"/>
<wire x1="241.3" y1="264.16" x2="241.3" y2="261.62" width="0.1524" layer="91"/>
<junction x="241.3" y="266.7"/>
<junction x="241.3" y="264.16"/>
<junction x="241.3" y="261.62"/>
<junction x="241.3" y="261.62"/>
<pinref part="GND13" gate="1" pin="GND"/>
<pinref part="IC2" gate="G$1" pin="GND"/>
<pinref part="IC2" gate="G$1" pin="UGND"/>
<pinref part="IC2" gate="G$1" pin="GND1"/>
<pinref part="IC2" gate="G$1" pin="GND2"/>
<pinref part="IC2" gate="G$1" pin="GND3"/>
<wire x1="241.3" y1="261.62" x2="241.3" y2="259.08" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="223.52" y1="281.94" x2="226.06" y2="281.94" width="0.1524" layer="91"/>
<pinref part="GND15" gate="1" pin="GND"/>
<pinref part="Y4" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND14" gate="1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="U$28" gate="G$1" pin="GND"/>
<wire x1="68.58" y1="226.06" x2="68.58" y2="223.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="U$27" gate="G$1" pin="GND"/>
<wire x1="25.4" y1="226.06" x2="25.4" y2="223.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="U$29" gate="G$1" pin="GND"/>
<wire x1="60.96" y1="226.06" x2="60.96" y2="223.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="38.1" y1="236.22" x2="38.1" y2="223.52" width="0.1524" layer="91"/>
<pinref part="U$30" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SW1" gate="G$1" pin="P1"/>
<pinref part="SW1" gate="G$1" pin="P"/>
<wire x1="208.28" y1="337.82" x2="208.28" y2="340.36" width="0.1524" layer="91"/>
<pinref part="GND34" gate="1" pin="GND"/>
<junction x="208.28" y="340.36"/>
</segment>
<segment>
<wire x1="-68.58" y1="213.36" x2="-68.58" y2="215.9" width="0.1524" layer="91"/>
<pinref part="GND50" gate="1" pin="GND"/>
<pinref part="R14" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U3" gate="P" pin="V-"/>
<pinref part="GND51" gate="1" pin="GND"/>
<wire x1="-48.26" y1="218.44" x2="-48.26" y2="213.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="Q3" gate="NMOS" pin="S"/>
<wire x1="294.64" y1="154.94" x2="299.72" y2="154.94" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="299.72" y1="154.94" x2="304.8" y2="157.48" width="0.1524" layer="91"/>
<junction x="299.72" y="154.94"/>
</segment>
<segment>
<pinref part="GND8" gate="1" pin="GND"/>
<pinref part="Q5" gate="NMOS" pin="S"/>
<wire x1="304.8" y1="142.24" x2="299.72" y2="139.7" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="299.72" y1="139.7" x2="294.64" y2="139.7" width="0.1524" layer="91"/>
<junction x="299.72" y="139.7"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="Q6" gate="NMOS" pin="S"/>
<wire x1="304.8" y1="127" x2="299.72" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="299.72" y1="124.46" x2="294.64" y2="124.46" width="0.1524" layer="91"/>
<junction x="299.72" y="124.46"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="Q1" gate="NMOS" pin="S"/>
<wire x1="294.64" y1="170.18" x2="299.72" y2="170.18" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="299.72" y1="170.18" x2="304.8" y2="172.72" width="0.1524" layer="91"/>
<junction x="299.72" y="170.18"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="GND"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="6"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R15" gate="G$1" pin="1"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="R17" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="R18" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R23" gate="G$1" pin="1"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$16" gate="G$1" pin="-VDC"/>
<wire x1="88.9" y1="25.4" x2="88.9" y2="22.86" width="0.1524" layer="91"/>
<wire x1="88.9" y1="22.86" x2="93.98" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U$17" gate="G$1" pin="GND"/>
<wire x1="93.98" y1="22.86" x2="101.6" y2="22.86" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="-"/>
<junction x="93.98" y="22.86"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="U$20" gate="G$1" pin="GND"/>
<wire x1="-50.8" y1="297.18" x2="-50.8" y2="302.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$19" gate="G$1" pin="GND"/>
<pinref part="U$22" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$19" gate="G$1" pin="PGND"/>
<pinref part="U$23" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="U$24" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="U$25" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="J11" gate="G$1" pin="4"/>
<pinref part="GND10" gate="1" pin="GND"/>
<pinref part="J11" gate="G$1" pin="3"/>
<wire x1="370.84" y1="40.64" x2="370.84" y2="43.18" width="0.1524" layer="91"/>
<junction x="370.84" y="40.64"/>
<pinref part="J11" gate="G$1" pin="2"/>
<wire x1="370.84" y1="43.18" x2="370.84" y2="45.72" width="0.1524" layer="91"/>
<junction x="370.84" y="43.18"/>
<pinref part="J11" gate="G$1" pin="1"/>
<wire x1="370.84" y1="45.72" x2="370.84" y2="48.26" width="0.1524" layer="91"/>
<junction x="370.84" y="45.72"/>
</segment>
</net>
<net name="RD-" class="0">
<segment>
<wire x1="187.96" y1="25.4" x2="167.64" y2="25.4" width="0.1524" layer="91"/>
<wire x1="167.64" y1="25.4" x2="167.64" y2="17.78" width="0.1524" layer="91"/>
<pinref part="C39" gate="G$1" pin="2"/>
<wire x1="167.64" y1="17.78" x2="162.56" y2="17.78" width="0.1524" layer="91"/>
<label x="180.34" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="55.88" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<label x="48.26" y="55.88" size="1.778" layer="95"/>
<pinref part="X2" gate="G$1" pin="RD-"/>
</segment>
</net>
<net name="RD+" class="0">
<segment>
<wire x1="187.96" y1="30.48" x2="165.1" y2="30.48" width="0.1524" layer="91"/>
<wire x1="165.1" y1="30.48" x2="165.1" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C38" gate="G$1" pin="2"/>
<wire x1="165.1" y1="27.94" x2="162.56" y2="27.94" width="0.1524" layer="91"/>
<label x="180.34" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="55.88" y1="45.72" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<label x="48.26" y="45.72" size="1.778" layer="95"/>
<pinref part="X2" gate="G$1" pin="RD+"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<wire x1="289.56" y1="284.48" x2="304.8" y2="284.48" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB1(SCK)"/>
<label x="292.1" y="284.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="SCLK"/>
<wire x1="187.96" y1="127" x2="198.12" y2="127" width="0.1524" layer="91"/>
<label x="190.5" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="243.84" y1="208.28" x2="251.46" y2="208.28" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="3"/>
<label x="243.84" y="208.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<wire x1="289.56" y1="287.02" x2="304.8" y2="287.02" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB2(PDI/MOSI)"/>
<label x="292.1" y="287.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="MOSI"/>
<wire x1="187.96" y1="132.08" x2="198.12" y2="132.08" width="0.1524" layer="91"/>
<label x="190.5" y="132.08" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="266.7" y1="208.28" x2="274.32" y2="208.28" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="4"/>
<label x="269.24" y="208.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<wire x1="289.56" y1="289.56" x2="304.8" y2="289.56" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB3(PDO/MISO)"/>
<label x="292.1" y="289.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="MISO"/>
<wire x1="187.96" y1="129.54" x2="198.12" y2="129.54" width="0.1524" layer="91"/>
<label x="190.5" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="243.84" y1="210.82" x2="251.46" y2="210.82" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="1"/>
<label x="243.84" y="210.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="INT" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="INT_N"/>
<wire x1="187.96" y1="134.62" x2="198.12" y2="134.62" width="0.1524" layer="91"/>
<label x="190.5" y="134.62" size="1.778" layer="95"/>
<pinref part="R3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RST" class="0">
<segment>
<label x="228.6" y="337.82" size="1.778" layer="95"/>
<wire x1="236.22" y1="332.74" x2="236.22" y2="337.82" width="0.1524" layer="91"/>
<pinref part="SW1" gate="G$1" pin="S1"/>
<wire x1="236.22" y1="337.82" x2="218.44" y2="337.82" width="0.1524" layer="91"/>
<pinref part="SW1" gate="G$1" pin="S"/>
<wire x1="218.44" y1="340.36" x2="218.44" y2="337.82" width="0.1524" layer="91"/>
<junction x="218.44" y="337.82"/>
<pinref part="IC2" gate="G$1" pin="/RESET"/>
<wire x1="236.22" y1="332.74" x2="241.3" y2="332.74" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="243.84" y1="205.74" x2="251.46" y2="205.74" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="5"/>
<label x="243.84" y="205.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="ACTLED" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="ACTLED"/>
<wire x1="187.96" y1="111.76" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
<wire x1="200.66" y1="111.76" x2="200.66" y2="109.22" width="0.1524" layer="91"/>
<wire x1="200.66" y1="109.22" x2="208.28" y2="109.22" width="0.1524" layer="91"/>
<label x="200.66" y="109.22" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="76.2" x2="58.42" y2="76.2" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="YEL-C"/>
<label x="48.26" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="LNKLED" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="LINKLED"/>
<wire x1="187.96" y1="106.68" x2="208.28" y2="106.68" width="0.1524" layer="91"/>
<label x="200.66" y="106.68" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="86.36" x2="58.42" y2="86.36" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="GRN-C"/>
<label x="48.26" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="TDP" class="0">
<segment>
<wire x1="187.96" y1="40.64" x2="162.56" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R19" gate="G$1" pin="1"/>
<wire x1="162.56" y1="40.64" x2="154.94" y2="40.64" width="0.1524" layer="91"/>
<wire x1="162.56" y1="40.64" x2="162.56" y2="43.18" width="0.1524" layer="91"/>
<junction x="162.56" y="40.64"/>
<label x="154.94" y="40.64" size="1.778" layer="95"/>
<label x="180.34" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="TXP"/>
<wire x1="129.54" y1="132.08" x2="116.84" y2="132.08" width="0.1524" layer="91"/>
<label x="116.84" y="132.08" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="30.48" x2="55.88" y2="30.48" width="0.1524" layer="91"/>
<label x="48.26" y="30.48" size="1.778" layer="95"/>
<pinref part="X2" gate="G$1" pin="TD+"/>
</segment>
</net>
<net name="TDN" class="0">
<segment>
<wire x1="187.96" y1="35.56" x2="149.86" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="1"/>
<wire x1="149.86" y1="35.56" x2="149.86" y2="43.18" width="0.1524" layer="91"/>
<wire x1="149.86" y1="35.56" x2="142.24" y2="35.56" width="0.1524" layer="91"/>
<junction x="149.86" y="35.56"/>
<label x="142.24" y="35.56" size="1.778" layer="95"/>
<label x="180.34" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="TXN"/>
<wire x1="129.54" y1="134.62" x2="116.84" y2="134.62" width="0.1524" layer="91"/>
<label x="116.84" y="134.62" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="40.64" x2="55.88" y2="40.64" width="0.1524" layer="91"/>
<label x="48.26" y="40.64" size="1.778" layer="95"/>
<pinref part="X2" gate="G$1" pin="TD-"/>
</segment>
</net>
<net name="RDP" class="0">
<segment>
<pinref part="R21" gate="G$1" pin="2"/>
<wire x1="127" y1="20.32" x2="127" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C38" gate="G$1" pin="1"/>
<wire x1="127" y1="27.94" x2="154.94" y2="27.94" width="0.1524" layer="91"/>
<wire x1="127" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91"/>
<junction x="127" y="27.94"/>
<label x="121.92" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="RXP"/>
<wire x1="129.54" y1="121.92" x2="114.3" y2="121.92" width="0.1524" layer="91"/>
<label x="114.3" y="121.92" size="1.778" layer="95"/>
</segment>
</net>
<net name="RDN" class="0">
<segment>
<pinref part="C39" gate="G$1" pin="1"/>
<wire x1="154.94" y1="17.78" x2="149.86" y2="17.78" width="0.1524" layer="91"/>
<wire x1="149.86" y1="17.78" x2="149.86" y2="20.32" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="2"/>
<wire x1="149.86" y1="20.32" x2="139.7" y2="20.32" width="0.1524" layer="91"/>
<wire x1="139.7" y1="20.32" x2="134.62" y2="20.32" width="0.1524" layer="91"/>
<junction x="139.7" y="20.32"/>
<label x="134.62" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="RXN"/>
<wire x1="129.54" y1="124.46" x2="114.3" y2="124.46" width="0.1524" layer="91"/>
<label x="114.3" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="TOCAP"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="162.56" y1="91.44" x2="162.56" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="1V2O"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="167.64" y1="91.44" x2="167.64" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="EXRES1"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="129.54" y1="111.76" x2="114.3" y2="111.76" width="0.1524" layer="91"/>
<wire x1="114.3" y1="111.76" x2="114.3" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="1"/>
<junction x="139.7" y="10.16"/>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="142.24" y1="10.16" x2="139.7" y2="10.16" width="0.1524" layer="91"/>
<wire x1="139.7" y1="10.16" x2="127" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C40" gate="G$1" pin="1"/>
<wire x1="142.24" y1="7.62" x2="142.24" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="XO"/>
<pinref part="C35" gate="G$1" pin="1"/>
<wire x1="187.96" y1="121.92" x2="236.22" y2="121.92" width="0.1524" layer="91"/>
<pinref part="25MHZ" gate="G$1" pin="2"/>
<wire x1="236.22" y1="121.92" x2="248.92" y2="121.92" width="0.1524" layer="91"/>
<wire x1="236.22" y1="119.38" x2="236.22" y2="121.92" width="0.1524" layer="91"/>
<junction x="236.22" y="121.92"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="C36" gate="G$1" pin="1"/>
<pinref part="25MHZ" gate="G$1" pin="1"/>
<wire x1="248.92" y1="109.22" x2="236.22" y2="109.22" width="0.1524" layer="91"/>
<wire x1="236.22" y1="109.22" x2="236.22" y2="114.3" width="0.1524" layer="91"/>
<wire x1="236.22" y1="109.22" x2="228.6" y2="109.22" width="0.1524" layer="91"/>
<wire x1="228.6" y1="109.22" x2="228.6" y2="111.76" width="0.1524" layer="91"/>
<junction x="236.22" y="109.22"/>
<wire x1="228.6" y1="111.76" x2="203.2" y2="111.76" width="0.1524" layer="91"/>
<wire x1="203.2" y1="119.38" x2="203.2" y2="111.76" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="XI/CLKIN"/>
<wire x1="187.96" y1="119.38" x2="203.2" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D-" class="0">
<segment>
<wire x1="228.6" y1="309.88" x2="236.22" y2="309.88" width="0.1524" layer="91"/>
<wire x1="236.22" y1="309.88" x2="241.3" y2="304.8" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="D-"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="D+" class="0">
<segment>
<wire x1="223.52" y1="307.34" x2="236.22" y2="307.34" width="0.1524" layer="91"/>
<wire x1="236.22" y1="307.34" x2="241.3" y2="302.26" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="D+"/>
<pinref part="R5" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="233.68" y1="279.4" x2="241.3" y2="279.4" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="XTAL2"/>
<pinref part="Y4" gate="G$1" pin="3"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="233.68" y1="287.02" x2="241.3" y2="287.02" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="XTAL1"/>
<pinref part="Y4" gate="G$1" pin="1"/>
<wire x1="233.68" y1="287.02" x2="233.68" y2="284.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="A5" class="0">
<segment>
<wire x1="289.56" y1="332.74" x2="304.8" y2="332.74" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF0(ADC0)"/>
<label x="292.1" y="332.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="A4" class="0">
<segment>
<wire x1="289.56" y1="330.2" x2="304.8" y2="330.2" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF1(ADC1)"/>
<label x="292.1" y="330.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="A3" class="0">
<segment>
<wire x1="289.56" y1="327.66" x2="304.8" y2="327.66" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF4(ADC4/TCK)"/>
<label x="292.1" y="327.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="J13" gate="G$1" pin="1"/>
<wire x1="322.58" y1="50.8" x2="312.42" y2="50.8" width="0.1524" layer="91"/>
<label x="312.42" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="A2" class="0">
<segment>
<wire x1="289.56" y1="325.12" x2="304.8" y2="325.12" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF5(ADC5/TMS)"/>
<label x="292.1" y="325.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="J13" gate="G$1" pin="2"/>
<wire x1="322.58" y1="48.26" x2="312.42" y2="48.26" width="0.1524" layer="91"/>
<label x="312.42" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="A1" class="0">
<segment>
<wire x1="289.56" y1="322.58" x2="304.8" y2="322.58" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF6(ADC6/TDO)"/>
<label x="292.1" y="322.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="J13" gate="G$1" pin="3"/>
<wire x1="322.58" y1="45.72" x2="312.42" y2="45.72" width="0.1524" layer="91"/>
<label x="312.42" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="11" class="0">
<segment>
<wire x1="289.56" y1="299.72" x2="304.8" y2="299.72" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB7(OC0A/OC1C/RTS)"/>
<label x="292.1" y="299.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="2" class="0">
<segment>
<wire x1="289.56" y1="261.62" x2="304.8" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PD1(INT1/SDA)"/>
<label x="292.1" y="261.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="210.82" y1="309.88" x2="213.36" y2="307.34" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="J6" gate="G$1" pin="D+"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="210.82" y1="307.34" x2="213.36" y2="309.88" width="0.1524" layer="91"/>
<wire x1="213.36" y1="309.88" x2="218.44" y2="309.88" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="J6" gate="G$1" pin="D-"/>
</segment>
</net>
<net name="AREF" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="AREF"/>
<wire x1="226.06" y1="292.1" x2="241.3" y2="292.1" width="0.1524" layer="91"/>
<label x="228.6" y="292.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="1" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD3(INT3/TXD1)"/>
<wire x1="289.56" y1="266.7" x2="304.8" y2="266.7" width="0.1524" layer="91"/>
<label x="292.1" y="266.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="0" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD2(INT2/RXD1)"/>
<wire x1="304.8" y1="264.16" x2="289.56" y2="264.16" width="0.1524" layer="91"/>
<label x="292.1" y="264.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="58.42" y1="241.3" x2="60.96" y2="241.3" width="0.1524" layer="91"/>
<wire x1="60.96" y1="241.3" x2="68.58" y2="241.3" width="0.1524" layer="91"/>
<wire x1="68.58" y1="241.3" x2="68.58" y2="243.84" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="68.58" y1="241.3" x2="68.58" y2="233.68" width="0.1524" layer="91"/>
<junction x="68.58" y="241.3"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="60.96" y1="233.68" x2="60.96" y2="241.3" width="0.1524" layer="91"/>
<junction x="60.96" y="241.3"/>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<pinref part="U2" gate="G$1" pin="OUT"/>
</segment>
<segment>
<wire x1="195.58" y1="73.66" x2="195.58" y2="78.74" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="195.58" y1="78.74" x2="198.12" y2="78.74" width="0.1524" layer="91"/>
<wire x1="195.58" y1="78.74" x2="185.42" y2="78.74" width="0.1524" layer="91"/>
<junction x="195.58" y="78.74"/>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="185.42" y1="78.74" x2="185.42" y2="73.66" width="0.1524" layer="91"/>
<wire x1="185.42" y1="78.74" x2="185.42" y2="83.82" width="0.1524" layer="91"/>
<junction x="185.42" y="78.74"/>
<pinref part="C11" gate="G$1" pin="1"/>
<pinref part="+3V7" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="1"/>
<wire x1="223.52" y1="106.68" x2="223.52" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="223.52" y1="101.6" x2="208.28" y2="101.6" width="0.1524" layer="91"/>
<junction x="223.52" y="101.6"/>
<wire x1="208.28" y1="101.6" x2="195.58" y2="101.6" width="0.1524" layer="91"/>
<wire x1="195.58" y1="101.6" x2="195.58" y2="114.3" width="0.1524" layer="91"/>
<junction x="208.28" y="101.6"/>
<pinref part="U4" gate="G$1" pin="VDD"/>
<wire x1="195.58" y1="114.3" x2="187.96" y2="114.3" width="0.1524" layer="91"/>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U$11" gate="G$1" pin="VCC-ISO"/>
<pinref part="+3V8" gate="G$1" pin="+3V3"/>
<wire x1="157.48" y1="238.76" x2="157.48" y2="243.84" width="0.1524" layer="91"/>
<wire x1="157.48" y1="243.84" x2="162.56" y2="243.84" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="289.56" y1="314.96" x2="309.88" y2="314.96" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PE2(!HWB)"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="241.3" y1="317.5" x2="241.3" y2="320.04" width="0.1524" layer="91"/>
<wire x1="228.6" y1="317.5" x2="241.3" y2="317.5" width="0.1524" layer="91"/>
<wire x1="241.3" y1="309.88" x2="241.3" y2="312.42" width="0.1524" layer="91"/>
<wire x1="241.3" y1="312.42" x2="228.6" y2="312.42" width="0.1524" layer="91"/>
<wire x1="228.6" y1="312.42" x2="228.6" y2="317.5" width="0.1524" layer="91"/>
<wire x1="228.6" y1="317.5" x2="228.6" y2="320.04" width="0.1524" layer="91"/>
<junction x="241.3" y="317.5"/>
<junction x="241.3" y="312.42"/>
<junction x="228.6" y="317.5"/>
<pinref part="IC2" gate="G$1" pin="VCC"/>
<pinref part="IC2" gate="G$1" pin="VCC1"/>
<pinref part="IC2" gate="G$1" pin="AVCC1"/>
<pinref part="IC2" gate="G$1" pin="AVCC"/>
<pinref part="+3V9" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="241.3" y1="297.18" x2="233.68" y2="297.18" width="0.1524" layer="91"/>
<wire x1="233.68" y1="297.18" x2="233.68" y2="302.26" width="0.1524" layer="91"/>
<wire x1="233.68" y1="302.26" x2="220.98" y2="302.26" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="UCAP"/>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="+3V10" gate="G$1" pin="+3V3"/>
<junction x="233.68" y="302.26"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="198.12" y1="149.86" x2="198.12" y2="144.78" width="0.1524" layer="91"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="-55.88" y1="223.52" x2="-58.42" y2="223.52" width="0.1524" layer="91"/>
<pinref part="U$32" gate="G$1" pin="3.3V"/>
<pinref part="U3" gate="A" pin="-IN"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="66.04" y1="71.12" x2="66.04" y2="81.28" width="0.1524" layer="91"/>
<wire x1="66.04" y1="81.28" x2="66.04" y2="86.36" width="0.1524" layer="91"/>
<junction x="66.04" y="81.28"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="J12" gate="G$1" pin="4"/>
<pinref part="+3V13" gate="G$1" pin="+3V3"/>
<pinref part="J12" gate="G$1" pin="1"/>
<pinref part="J12" gate="G$1" pin="2"/>
<wire x1="370.84" y1="27.94" x2="370.84" y2="25.4" width="0.1524" layer="91"/>
<pinref part="J12" gate="G$1" pin="3"/>
<wire x1="370.84" y1="25.4" x2="370.84" y2="22.86" width="0.1524" layer="91"/>
<junction x="370.84" y="25.4"/>
<wire x1="370.84" y1="22.86" x2="370.84" y2="20.32" width="0.1524" layer="91"/>
<junction x="370.84" y="22.86"/>
<junction x="370.84" y="20.32"/>
</segment>
</net>
<net name="VBUS" class="0">
<segment>
<wire x1="231.14" y1="327.66" x2="231.14" y2="330.2" width="0.1524" layer="91"/>
<wire x1="241.3" y1="327.66" x2="231.14" y2="327.66" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="VBUS"/>
<pinref part="U$10" gate="G$1" pin="VBUS"/>
</segment>
<segment>
<wire x1="-55.88" y1="198.12" x2="-40.64" y2="198.12" width="0.1524" layer="91"/>
<label x="-50.8" y="198.12" size="1.778" layer="95"/>
<pinref part="T1" gate="A" pin="D"/>
<pinref part="U$21" gate="G$1" pin="VBUS"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="VCC"/>
<pinref part="U$5" gate="G$1" pin="VBUS"/>
</segment>
</net>
<net name="13" class="0">
<segment>
<wire x1="289.56" y1="304.8" x2="304.8" y2="304.8" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PC7(ICP3/CLK0/OC4A)"/>
<label x="292.1" y="304.8" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="294.64" y1="106.68" x2="302.26" y2="106.68" width="0.1524" layer="91"/>
<pinref part="D5" gate="G$1" pin="A"/>
<label x="297.18" y="109.22" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="A0" class="0">
<segment>
<wire x1="289.56" y1="320.04" x2="304.8" y2="320.04" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PF7(ADC7(TDI)"/>
<label x="292.1" y="320.04" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="322.58" y1="43.18" x2="312.42" y2="43.18" width="0.1524" layer="91"/>
<label x="312.42" y="43.18" size="1.778" layer="95"/>
<pinref part="J13" gate="G$1" pin="4"/>
</segment>
</net>
<net name="3" class="0">
<segment>
<wire x1="289.56" y1="259.08" x2="304.8" y2="259.08" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PD0(INT0/OC0B/SCL)"/>
<label x="292.1" y="259.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="D4" class="0">
<segment>
<wire x1="289.56" y1="269.24" x2="304.8" y2="269.24" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PD4(ICP1/ADC8)"/>
<label x="292.1" y="269.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="D8" class="0">
<segment>
<wire x1="289.56" y1="292.1" x2="304.8" y2="292.1" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB4(ADC11)"/>
<label x="292.1" y="292.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="D7" class="0">
<segment>
<wire x1="289.56" y1="312.42" x2="304.8" y2="312.42" width="0.1524" layer="91"/>
<label x="292.1" y="312.42" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PE6(INT.6/AIN0)"/>
</segment>
</net>
<net name="WIZ_RST" class="0">
<segment>
<wire x1="289.56" y1="271.78" x2="304.8" y2="271.78" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PD5(XCK/CTS)"/>
<label x="292.1" y="271.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="RST_N"/>
<wire x1="172.72" y1="149.86" x2="177.8" y2="149.86" width="0.1524" layer="91"/>
<label x="180.34" y="149.86" size="1.778" layer="95"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="177.8" y1="149.86" x2="185.42" y2="149.86" width="0.1524" layer="91"/>
<junction x="177.8" y="149.86"/>
</segment>
</net>
<net name="SCSN_WIZ" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="SCS_N"/>
<label x="190.5" y="124.46" size="1.778" layer="95"/>
<wire x1="187.96" y1="124.46" x2="198.12" y2="124.46" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PB0(SS)"/>
<wire x1="289.56" y1="281.94" x2="304.8" y2="281.94" width="0.1524" layer="91"/>
<label x="292.1" y="281.94" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="2"/>
</segment>
</net>
<net name="VCCA" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="AVDD@3"/>
<wire x1="129.54" y1="109.22" x2="106.68" y2="109.22" width="0.1524" layer="91"/>
<wire x1="106.68" y1="109.22" x2="106.68" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="AVDD@2"/>
<wire x1="106.68" y1="116.84" x2="106.68" y2="127" width="0.1524" layer="91"/>
<wire x1="106.68" y1="127" x2="106.68" y2="132.08" width="0.1524" layer="91"/>
<wire x1="129.54" y1="116.84" x2="106.68" y2="116.84" width="0.1524" layer="91"/>
<junction x="106.68" y="116.84"/>
<pinref part="U4" gate="G$1" pin="AVDD@1"/>
<wire x1="129.54" y1="127" x2="106.68" y2="127" width="0.1524" layer="91"/>
<junction x="106.68" y="127"/>
<pinref part="U$7" gate="G$1" pin="VCCA"/>
</segment>
<segment>
<pinref part="U$6" gate="G$1" pin="VCCA"/>
<wire x1="294.64" y1="83.82" x2="294.64" y2="78.74" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="2"/>
<wire x1="213.36" y1="78.74" x2="220.98" y2="78.74" width="0.1524" layer="91"/>
<wire x1="220.98" y1="78.74" x2="233.68" y2="78.74" width="0.1524" layer="91"/>
<wire x1="233.68" y1="78.74" x2="243.84" y2="78.74" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="220.98" y1="73.66" x2="220.98" y2="78.74" width="0.1524" layer="91"/>
<junction x="220.98" y="78.74"/>
<wire x1="233.68" y1="73.66" x2="233.68" y2="78.74" width="0.1524" layer="91"/>
<junction x="233.68" y="78.74"/>
<wire x1="243.84" y1="73.66" x2="243.84" y2="78.74" width="0.1524" layer="91"/>
<junction x="243.84" y="78.74"/>
<wire x1="243.84" y1="78.74" x2="294.64" y2="78.74" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="C10" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="1"/>
<wire x1="162.56" y1="55.88" x2="149.86" y2="55.88" width="0.1524" layer="91"/>
<wire x1="149.86" y1="55.88" x2="137.16" y2="55.88" width="0.1524" layer="91"/>
<wire x1="137.16" y1="55.88" x2="137.16" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="2"/>
<wire x1="149.86" y1="53.34" x2="149.86" y2="55.88" width="0.1524" layer="91"/>
<junction x="149.86" y="55.88"/>
<pinref part="R19" gate="G$1" pin="2"/>
<wire x1="162.56" y1="53.34" x2="162.56" y2="55.88" width="0.1524" layer="91"/>
<wire x1="137.16" y1="55.88" x2="137.16" y2="58.42" width="0.1524" layer="91"/>
<junction x="137.16" y="55.88"/>
<pinref part="U$9" gate="G$1" pin="VCCA"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="AVDD@6"/>
<wire x1="165.1" y1="91.44" x2="165.1" y2="83.82" width="0.1524" layer="91"/>
<wire x1="165.1" y1="83.82" x2="154.94" y2="83.82" width="0.1524" layer="91"/>
<wire x1="154.94" y1="83.82" x2="149.86" y2="83.82" width="0.1524" layer="91"/>
<wire x1="149.86" y1="83.82" x2="129.54" y2="83.82" width="0.1524" layer="91"/>
<wire x1="129.54" y1="83.82" x2="129.54" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="AVDD@4"/>
<wire x1="149.86" y1="91.44" x2="149.86" y2="83.82" width="0.1524" layer="91"/>
<junction x="149.86" y="83.82"/>
<pinref part="U4" gate="G$1" pin="AVDD@5"/>
<wire x1="154.94" y1="91.44" x2="154.94" y2="83.82" width="0.1524" layer="91"/>
<junction x="154.94" y="83.82"/>
<pinref part="U$8" gate="G$1" pin="VCCA"/>
</segment>
</net>
<net name="EN1" class="0">
<segment>
<wire x1="312.42" y1="180.34" x2="307.34" y2="180.34" width="0.1524" layer="91"/>
<label x="302.26" y="180.34" size="1.778" layer="95" rot="MR0"/>
<pinref part="D1" gate="G$1" pin="A"/>
<pinref part="Q1" gate="NMOS" pin="G"/>
<wire x1="307.34" y1="180.34" x2="299.72" y2="180.34" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="2"/>
<junction x="299.72" y="180.34"/>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="284.48" y1="180.34" x2="299.72" y2="180.34" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="289.56" y1="307.34" x2="304.8" y2="307.34" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PC6(OC3A/!OC4A)"/>
<label x="292.1" y="307.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="DRAIN1" class="0">
<segment>
<wire x1="342.9" y1="172.72" x2="314.96" y2="172.72" width="0.1524" layer="91"/>
<label x="325.12" y="172.72" size="1.778" layer="95" rot="MR0"/>
<pinref part="J2" gate="G$1" pin="2"/>
<pinref part="Q1" gate="NMOS" pin="D"/>
</segment>
</net>
<net name="EN2" class="0">
<segment>
<wire x1="312.42" y1="165.1" x2="307.34" y2="165.1" width="0.1524" layer="91"/>
<label x="302.26" y="165.1" size="1.778" layer="95" rot="MR0"/>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="Q3" gate="NMOS" pin="G"/>
<wire x1="307.34" y1="165.1" x2="299.72" y2="165.1" width="0.1524" layer="91"/>
<junction x="307.34" y="165.1"/>
<pinref part="R10" gate="G$1" pin="2"/>
<junction x="299.72" y="165.1"/>
<pinref part="J8" gate="G$1" pin="1"/>
<wire x1="284.48" y1="165.1" x2="299.72" y2="165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="289.56" y1="297.18" x2="304.8" y2="297.18" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB6(OC1B/OC4B/ADC13)"/>
<label x="292.1" y="297.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="DRAIN2" class="0">
<segment>
<wire x1="342.9" y1="157.48" x2="314.96" y2="157.48" width="0.1524" layer="91"/>
<label x="325.12" y="157.48" size="1.778" layer="95" rot="MR0"/>
<pinref part="J3" gate="G$1" pin="2"/>
<pinref part="Q3" gate="NMOS" pin="D"/>
</segment>
</net>
<net name="EN3" class="0">
<segment>
<wire x1="312.42" y1="149.86" x2="307.34" y2="149.86" width="0.1524" layer="91"/>
<label x="302.26" y="149.86" size="1.778" layer="95" rot="MR0"/>
<pinref part="D3" gate="G$1" pin="A"/>
<pinref part="Q5" gate="NMOS" pin="G"/>
<wire x1="307.34" y1="149.86" x2="299.72" y2="149.86" width="0.1524" layer="91"/>
<junction x="307.34" y="149.86"/>
<pinref part="R9" gate="G$1" pin="2"/>
<junction x="299.72" y="149.86"/>
<pinref part="J9" gate="G$1" pin="1"/>
<wire x1="284.48" y1="149.86" x2="299.72" y2="149.86" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="289.56" y1="294.64" x2="304.8" y2="294.64" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PB5(OC1A/ADC12/!OC4B)"/>
<label x="292.1" y="294.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="DRAIN3" class="0">
<segment>
<wire x1="342.9" y1="142.24" x2="314.96" y2="142.24" width="0.1524" layer="91"/>
<label x="322.58" y="142.24" size="1.778" layer="95" rot="MR0"/>
<pinref part="J4" gate="G$1" pin="2"/>
<pinref part="Q5" gate="NMOS" pin="D"/>
</segment>
</net>
<net name="EN4" class="0">
<segment>
<wire x1="312.42" y1="134.62" x2="307.34" y2="134.62" width="0.1524" layer="91"/>
<label x="302.26" y="134.62" size="1.778" layer="95" rot="MR0"/>
<pinref part="D4" gate="G$1" pin="A"/>
<pinref part="Q6" gate="NMOS" pin="G"/>
<wire x1="307.34" y1="134.62" x2="299.72" y2="134.62" width="0.1524" layer="91"/>
<junction x="307.34" y="134.62"/>
<pinref part="R6" gate="G$1" pin="2"/>
<junction x="299.72" y="134.62"/>
<pinref part="J10" gate="G$1" pin="1"/>
<wire x1="284.48" y1="134.62" x2="299.72" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="289.56" y1="276.86" x2="304.8" y2="276.86" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PD7(OC4D/ADC10/T0)"/>
<label x="292.1" y="276.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="DRAIN4" class="0">
<segment>
<wire x1="342.9" y1="127" x2="314.96" y2="127" width="0.1524" layer="91"/>
<label x="325.12" y="127" size="1.778" layer="95" rot="MR0"/>
<pinref part="J5" gate="G$1" pin="2"/>
<pinref part="Q6" gate="NMOS" pin="D"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<pinref part="C2" gate="G$1" pin="+"/>
<wire x1="109.22" y1="60.96" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="96.52" y1="60.96" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<junction x="104.14" y="60.96"/>
<pinref part="U$1" gate="G$1" pin="+VDC"/>
<wire x1="96.52" y1="60.96" x2="88.9" y2="60.96" width="0.1524" layer="91"/>
<junction x="96.52" y="60.96"/>
<pinref part="U$4" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<label x="-50.8" y="309.88" size="1.778" layer="95"/>
<pinref part="U$33" gate="G$1" pin="VBAT"/>
<wire x1="-58.42" y1="309.88" x2="-58.42" y2="312.42" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="309.88" x2="-50.8" y2="309.88" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="-50.8" y1="309.88" x2="-35.56" y2="309.88" width="0.1524" layer="91"/>
<junction x="-50.8" y="309.88"/>
<pinref part="U$19" gate="G$1" pin="VCC"/>
</segment>
<segment>
<wire x1="-68.58" y1="243.84" x2="-68.58" y2="241.3" width="0.1524" layer="91"/>
<label x="-76.835" y="243.84" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="-68.58" y1="243.84" x2="-78.74" y2="243.84" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="243.84" x2="-78.74" y2="246.38" width="0.1524" layer="91"/>
<pinref part="U$34" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<pinref part="U$3" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="1"/>
<pinref part="U$12" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="J5" gate="G$1" pin="1"/>
<pinref part="U$14" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="1"/>
<pinref part="U$13" gate="G$1" pin="VBAT"/>
</segment>
<segment>
<pinref part="U$16" gate="G$1" pin="+VDC"/>
<wire x1="88.9" y1="30.48" x2="93.98" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U$18" gate="G$1" pin="VBAT"/>
<wire x1="93.98" y1="30.48" x2="101.6" y2="30.48" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="+"/>
<junction x="93.98" y="30.48"/>
</segment>
</net>
<net name="+5V" class="3">
<segment>
<pinref part="P+10" gate="1" pin="+5V"/>
<wire x1="-20.32" y1="198.12" x2="-20.32" y2="200.66" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="198.12" x2="-20.32" y2="198.12" width="0.1524" layer="91"/>
<pinref part="T1" gate="A" pin="S"/>
<label x="-30.48" y="198.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P+9" gate="1" pin="+5V"/>
<pinref part="U3" gate="P" pin="V+"/>
<wire x1="-48.26" y1="238.76" x2="-48.26" y2="233.68" width="0.1524" layer="91"/>
</segment>
<segment>
<junction x="25.4" y="241.3"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="38.1" y1="241.3" x2="25.4" y2="241.3" width="0.1524" layer="91"/>
<wire x1="25.4" y1="241.3" x2="25.4" y2="238.76" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<wire x1="25.4" y1="238.76" x2="25.4" y2="233.68" width="0.1524" layer="91"/>
<wire x1="25.4" y1="256.54" x2="25.4" y2="241.3" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="EN"/>
<label x="35.56" y="238.76" size="1.778" layer="95" rot="R270"/>
<wire x1="38.1" y1="238.76" x2="25.4" y2="238.76" width="0.1524" layer="91"/>
<junction x="25.4" y="238.76"/>
<pinref part="P+1" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="2"/>
<wire x1="266.7" y1="213.36" x2="266.7" y2="210.82" width="0.1524" layer="91"/>
<pinref part="P+2" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="-2.54" y1="307.34" x2="0" y2="307.34" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="0" y1="307.34" x2="7.62" y2="307.34" width="0.1524" layer="91"/>
<junction x="0" y="307.34"/>
<wire x1="7.62" y1="307.34" x2="15.24" y2="307.34" width="0.1524" layer="91"/>
<junction x="7.62" y="307.34"/>
<pinref part="P+3" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="U$19" gate="G$1" pin="FB"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<wire x1="-17.78" y1="302.26" x2="-20.32" y2="302.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GATE_CMD" class="0">
<segment>
<wire x1="-33.02" y1="203.2" x2="-33.02" y2="226.06" width="0.1524" layer="91"/>
<label x="-33.02" y="205.74" size="1.778" layer="95" rot="R90"/>
<pinref part="T1" gate="A" pin="G"/>
<pinref part="U3" gate="A" pin="OUT"/>
<wire x1="-40.64" y1="226.06" x2="-33.02" y2="226.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CMP" class="0">
<segment>
<wire x1="-68.58" y1="231.14" x2="-68.58" y2="228.6" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="228.6" x2="-68.58" y2="226.06" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="228.6" x2="-55.88" y2="228.6" width="0.1524" layer="91"/>
<junction x="-68.58" y="228.6"/>
<label x="-60.96" y="228.6" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="R14" gate="G$1" pin="2"/>
<pinref part="U3" gate="A" pin="+IN"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="C"/>
<pinref part="R15" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="C"/>
<pinref part="R16" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="D3" gate="G$1" pin="C"/>
<pinref part="R17" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="D4" gate="G$1" pin="C"/>
<pinref part="R18" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="2"/>
<pinref part="D5" gate="G$1" pin="C"/>
<wire x1="312.42" y1="106.68" x2="309.88" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GRN-A"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="45.72" y1="81.28" x2="55.88" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="X2" gate="G$1" pin="YEL-A"/>
<wire x1="55.88" y1="71.12" x2="45.72" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="BST"/>
<pinref part="C14" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="VSW"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="-20.32" y1="307.34" x2="-12.7" y2="307.34" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="-12.7" y1="307.34" x2="-12.7" y2="312.42" width="0.1524" layer="91"/>
<junction x="-12.7" y="307.34"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
</compatibility>
</eagle>
