// Copyright (c) 2017, iblasco. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:bootstrap_modal/src/modal_bs_service.dart';
import 'src/todo_list/todo_list_component.dart';
// ignore: uri_has_not_been_generated
import 'src/todo_list/todo_list_component.template.dart' as todo_list;
import 'src/modal_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, TodoListComponent,ModalBSComponent],
  providers: const [materialProviders, ModalBsService],
)
class AppComponent{
  final ViewContainerRef _location;
  final ModalBsService _modalService;

  AppComponent(this._location, this._modalService);

  ModalBSComponent modalSimple;
  ModalBSComponent modalComponent;

  @ViewChild('modalHtml', read: ModalBSComponent)
  ModalBSComponent modalHtml;

  ///Creates a simple modal an set some variabled, then show it
  createModalSimple(){
    if(modalSimple == null){
    modalSimple = _modalService.createSimpleModal(_location,header: "This is a header",content: "This is the text content");
    modalSimple.buttonStream.listen(modalActionSimple);
    modalSimple.addAccept(label: "OK");
    modalSimple.addCancel();
    modalSimple.addCustomButton("Custom button", "testButton1");
    }
    modalSimple.open();
  }
  ///Creates a modal with a component set some variabled, then show it
  createModalComponent(){
    if(modalComponent == null) {
      modalComponent = _modalService.createComponentModal(
          _location,todo_list.TodoListComponentNgFactory
          , header: "This is the header",dismissable: false);
      modalComponent.buttonStream.listen(modalActionComponent);
      modalComponent.backdrop = false;
      modalComponent.addAccept();
      modalComponent.addCancel(label: "CLOSE");
      modalComponent.addCustomButton("Custom button", "testButton1");
    }
    modalComponent.open();
  }

  createModalHtml(){
    modalHtml.buttonStream.listen(modalActionHtml);
    modalHtml.open();
  }

  ///Listen tho the [buttonStream] of the modal and react to the events
  modalActionSimple(String id){
    print(id);
    switch(id){
      case "acceptModal":
        window.alert("You accepted the modal simple");
        modalSimple.close();
        break;
      case "cancelModal":
        window.alert("You canceled the modal simple");
        modalSimple.close();
        break;
      case "testButton1":
        window.alert("You pressed the custom button");
        modalSimple.close();
        break;
      case "dimissableModal":
        window.alert("You dismissed the modal");
        modalSimple.close();
        break;
    }
  }

  ///Listen tho the [buttonStream] of the modal and react to the events
  modalActionComponent(String id){
    switch(id){
      case "acceptModal":
        window.alert("You accepted the modal simple");
        modalComponent.close();
        break;
      case "cancelModal":
        window.alert("You canceled the modal simple");
        modalComponent.close();
        break;
      case "testButton1":
        window.alert("You pressed the custom button");
        modalComponent.close();
    }
  }

  ///Listen tho the [buttonStream] of the modal and react to the events
  modalActionHtml(String id){
    switch(id){
      case "dimissableModal":
        window.alert("You dismissed the html button");
        modalHtml.close();
        break;
    }
  }
}
