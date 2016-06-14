function UTC_Callback(hObject, eventdata, handles)
% hObject handle to UTC (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of UTC as text
% str2double(get(hObject,'String')) returns contents of UTC as a double
% --- Executes during object creation, after setting all properties.
function UTC_CreateFcn(hObject, eventdata, handles)
% hObject handle to UTC (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
% See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end
