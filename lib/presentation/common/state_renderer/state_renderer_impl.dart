import 'package:flutter/material.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';

abstract class FlowState {
  StateRendererType get stateType;
  String get stateMessage;
}

class PopupLoadingState implements FlowState {
  final String message;

  PopupLoadingState({
    this.message = StringsManager.loading,
  });

  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.popupLoadingState;
}

class FullScreenLoadingState implements FlowState {
  final String message;

  FullScreenLoadingState({
    this.message = StringsManager.loading,
  });

  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.fullScreenLoadingState;
}

class PopupErrorState implements FlowState {
  final String message;

  PopupErrorState({
    required this.message,
  });
  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.popupErrorState;
}

class PopupSuccessState implements FlowState {
  final String message;

  PopupSuccessState({
    required this.message,
  });
  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.popupSuccessState;
}

class FullScreenErrorState implements FlowState {
  final String message;

  FullScreenErrorState({
    required this.message,
  });
  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.fullScreenErrorState;
}

class FullScreenEmptyState implements FlowState {
  final String message;

  FullScreenEmptyState({
    required this.message,
  });
  @override
  String get stateMessage => message;

  @override
  StateRendererType get stateType => StateRendererType.fullScreenEmptyState;
}

class ContentState implements FlowState {
  @override
  String get stateMessage => AppConstants.empty;

  @override
  StateRendererType get stateType => StateRendererType.contentState;
}

extension FlowStateExtention on FlowState {
  Widget getScreenWidget({
    required BuildContext context,
    required Widget contentScreenWidget,
    required Function retryFunction,
  }) {
    switch (this) {
      case FullScreenLoadingState():
        {
          return StateRenderer(
            message: stateMessage,
            stateRendererType: stateType,
            retryFunction: retryFunction,
          );
        }

      case FullScreenErrorState():
        {
          return StateRenderer(
            message: stateMessage,
            stateRendererType: stateType,
            retryFunction: retryFunction,
          );
        }
      case FullScreenEmptyState():
        {
          return StateRenderer(
            message: stateMessage,
            stateRendererType: stateType,
            retryFunction: retryFunction,
          );
        }

      case PopupLoadingState():
        {
          dismissDialog(context: context);
          showPopup(
            context: context,
            stateRendererType: stateType,
            message: stateMessage,
          );
          return contentScreenWidget;
        }
      case PopupSuccessState():
        {
          dismissDialog(context: context);
          showPopup(
            context: context,
            stateRendererType: stateType,
            message: stateMessage,
            retryFunction: retryFunction,
          );
          return contentScreenWidget;
        }

      case PopupErrorState():
        {
          dismissDialog(context: context);
          showPopup(
            context: context,
            stateRendererType: stateType,
            message: stateMessage,
            retryFunction: retryFunction,
          );
          return contentScreenWidget;
        }

      case ContentState():
        {
          dismissDialog(context: context);
          return contentScreenWidget;
        }

      default:
        {
          dismissDialog(context: context);

          return contentScreenWidget;
        }
    }
  }

  bool _isCurrentDialogShowing({
    required BuildContext context,
  }) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog({required BuildContext context}) {
    if (_isCurrentDialogShowing(context: context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  showPopup({
    required BuildContext context,
    required StateRendererType stateRendererType,
    required String message,
    Function? retryFunction,
  }) {
    // dismissDialog(context: context);// !you can use later
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message,
          retryFunction: retryFunction ?? () {},
        ),
      ),
    );
  }
}
