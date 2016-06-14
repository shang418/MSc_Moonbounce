% --- Executes on button press in Start_moon.
function Start_moon_Callback(hObject, eventdata, handles)
% hObject handle to Start_moon (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
global a;
global az_pin_step;
global el_pin_step;
global az_pin_dir;
global el_pin_dir;
global az;
global el;
global step_angle;
set(handles.Start_moon,'UserData', ~get(handles.Start_moon, 'UserData'));
if get(handles.Start_moon, 'UserData') == true
tic
set(handles.Start_moon,'String', 'Stop Tracking the Moon');
lat = str2double(get(handles.Lat,'String'));
long = str2double(get(handles.Long,'String'));
height = str2double(get(handles.Height,'String'));
UTC = local_time_to_utc(clock); %=====automatic UTC!
set(handles.UTC, 'string', UTC);
[az, el] = LunarAzEl(UTC, lat, long, height);
set(handles.El, 'string', el);
set(handles.Az, 'string', az);
el_steps = round(el/step_angle); %step motors have <step_angle> degree per step
az_steps = round(az/step_angle); %subject to changes on GEAR
az_temp = az;
el_temp = el;
digitalWrite(a,el_pin_dir,1);
digitalWrite(a,az_pin_dir,1);
set(handles.UTC, 'string', local_time_to_utc(clock)); %update time
for i = 1:el_steps
digitalWrite(a,el_pin_step,1); %THIS COMMAND IS TIME CONSUMING!
digitalWrite(a,el_pin_step,0);
end
for i = 1:az_steps
46
digitalWrite(a,az_pin_step,1); %THIS COMMAND IS TIME CONSUMING!
digitalWrite(a,az_pin_step,0);
end
toc
while el > 0 %while loop to execute realtime update
if ~get(handles.Start_moon, 'UserData')
break;
end
UTC = local_time_to_utc(clock);
[az, el] = LunarAzEl(UTC, lat, long, height);
set(handles.El, 'string', el);
set(handles.Az, 'string', az);
set(handles.UTC, 'string', UTC);
if el - el_temp > step_angle %test value used
digitalWrite(a,el_pin_dir,1);
digitalWrite(a,el_pin_step,1);
digitalWrite(a,el_pin_step,0);
el_temp = el; %PROBLEMATIC!! consider elevation decrement
disp('turn el 1 step +')
end
if az - az_temp > step_angle
digitalWrite(a,az_pin_dir,1);
digitalWrite(a,az_pin_step,1);
digitalWrite(a,az_pin_step,0);
az_temp = az;
disp('turn az 1 step +')
end
if el - el_temp < -step_angle %test value used
digitalWrite(a,el_pin_dir,0);
digitalWrite(a,el_pin_step,1);
digitalWrite(a,el_pin_step,0);
el_temp = el; %PROBLEMATIC!! consider elevation decrement
disp('turn el 1 step -')
end
if az - az_temp < -step_angle
digitalWrite(a,az_pin_dir,0);
digitalWrite(a,az_pin_step,1);
digitalWrite(a,az_pin_step,0);
az_temp = az;
disp('turn az 1 step -')
end
pause(1); %hold the loop for 1 second
end
el_steps = round(el/step_angle); %step motors have <step_angle> degree per step
az_steps = round(az/step_angle); %subject to changes on GEAR
digitalWrite(a,el_pin_dir,0);
for i = 1:el_steps
digitalWrite(a,el_pin_step,1);
digitalWrite(a,el_pin_step,0);
end
digitalWrite(a,az_pin_dir,0);
for i = 1:az_steps
digitalWrite(a,az_pin_step,1);
47
digitalWrite(a,az_pin_step,0);
end
else
set(handles.Start_moon, 'String', 'Start Tracking the Moon');
end
