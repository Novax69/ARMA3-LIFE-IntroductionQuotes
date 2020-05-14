#include "..\..\script_macros.hpp"
/*
    File: fn_NovIntroductionQuotes.sqf
    Author: Novax
   	github : https://github.com/Novax69 <== Find my other scripts for arma here
    Date : 14/05/2020

    Description:
	Introduction music + quotes to make it looks smooth :D
*/



private["_selectedQuote","_quote","_author","_date","_random","_language","_arraySize"];

_language = LIFE_SETTINGS(getText,"nov_quotesLanguage");





if(_language isEqualTo "FR") then {
	_selectedQuote = getArray(missionConfigFile >> "FRNovQuotes" >> "allQuotes");
	_arraySize = count _selectedQuote;
	_random = random _arraySize;
	_selectedQuote = _selectedQuote select _random;
	_quote = getText(missionConfigFile >> "FRNovQuotes" >> _selectedQuote >> "text" );
	_author = getText(missionConfigFile >> "FRNovQuotes" >> _selectedQuote >> "author");
	_date = getText(missionConfigFile >> "FRNovQuotes" >> _selectedQuote >> "date");
} else {
	_selectedQuote = getArray(missionConfigFile >> "EngNovQuotes" >> "allQuotes");
	_arraySize = count _selectedQuote;
	_random = random _arraySize;
	_selectedQuote = _selectedQuote select _random;
	_quote = getText(missionConfigFile >> "EngNovQuotes" >> _selectedQuote >> "text" );
	_author = getText(missionConfigFile >> "EngNovQuotes" >> _selectedQuote >> "author");
	_date = getText(missionConfigFile >> "EngNovQuotes" >> _selectedQuote >> "date");
};

[] spawn {
	ace_hearing_disableVolumeUpdate = true; // Comment this lines if you don't have ACE
	playMusic ["LeadTrack01_F_Mark", 1];
	18 fadeMusic 0;
	sleep 18.5;
	playMusic "";
	ace_hearing_disableVolumeUpdate = false; // Comment this line if you don't have ACE
};

0 cutText ["","BLACK FADED",15];
if(_date isEqualTo "") then {
	[format["<t font='PuristaBold' align='left' size = '1.5'>%1</t><br /><t font='PuristaBold' color='#c48214' align='right' size = '1.5'>- %2</t>",_quote,_author],0,0.25,15,1] spawn BIS_fnc_dynamicText;
} else {
	[format["<t font='PuristaBold' align='left' size = '1.5'>%1</t><br /><t font='PuristaBold' color='#c48214' align='right' size = '1.5'>- %2 (%3)</t>",_quote,_author,_date],0,0.25,15,1] spawn BIS_fnc_dynamicText;
};
sleep 15.5;
0 cutText ["","BLACK IN"];

