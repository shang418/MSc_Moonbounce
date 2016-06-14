function El_Callback(hObject, eventdata, handles)
% hObject handle to El (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
49
% Hints: get(hObject,'String') returns contents of El as text
% str2double(get(hObject,'String')) returns contents of El as a double
% --- Executes during object creation, after setting all properties.
function El_CreateFcn(hObject, eventdata, handles)
% hObject handle to El (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
% See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end