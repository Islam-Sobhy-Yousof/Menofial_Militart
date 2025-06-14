import 'package:flutter/material.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/animated_image.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/dialog_content.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/popup_dialog.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/retry_button.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/state_renderer_column.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_widgets/state_renderer_message.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';

enum StateRendererType {
  //Popup States
  popupLoadingState,
  popupErrorState,
  popupSuccessState,

//Full Screen States
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

//General State
  contentState,
}

// ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  Function retryFunction;
  StateRenderer({
    super.key,
    required this.stateRendererType,
    this.message = AppConstants.empty,
    this.title = AppConstants.empty,
    required this.retryFunction,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return _getStateWidget(context: context);
  }

  Widget _getStateWidget({required BuildContext context}) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return PopupDialog(
          child: DialogContent(
            children: [
              AnimatedImage(
                name: JsonAssets.loading,
              ),
            ],
          ),
        );
      case StateRendererType.popupErrorState:
        return PopupDialog(
          child: DialogContent(
            children: [
              StateRendererMessage(message: message),
              AnimatedImage(
                name: JsonAssets.error,
              ),
              RetryButton(
                title: StringsManager.ok,
                onPressed: () {
                  Navigator.of(context).pop();
                  retryFunction();
                },
                stateRendererType: stateRendererType,
              ),
            ],
          ),
        );
      case StateRendererType.fullScreenLoadingState:
        return StateRendererColumn(
          children: [
            AnimatedImage(
              name: JsonAssets.loading,
            ),
            StateRendererMessage(
              message: StringsManager.loading,
            ),
          ],
        );
      case StateRendererType.fullScreenErrorState:
        return StateRendererColumn(
          children: [
            AnimatedImage(
              name: JsonAssets.error,
            ),
            StateRendererMessage(
              message: StringsManager.fullscreenErrorMessage,
            ),
            RetryButton(
              title: StringsManager.retryAgain,
              onPressed: () {
                retryFunction();
              },
              stateRendererType: stateRendererType,
            ),
          ],
        );
      case StateRendererType.fullScreenEmptyState:
        return StateRendererColumn(
          children: [
            AnimatedImage(
              name: JsonAssets.empty,
            ),
            StateRendererMessage(
              message: StringsManager.fullscreenEmptyMessage,
            ),
          ],
        );
      case StateRendererType.contentState:
        return Container();
      case StateRendererType.popupSuccessState:
        return PopupDialog(
          child: DialogContent(
            children: [
              AnimatedImage(
                name: JsonAssets.success,
              ),
              StateRendererMessage(message: message),
              RetryButton(
                title: StringsManager.ok,
                onPressed: () {
                  Navigator.of(context).pop();
                  retryFunction();
                },
                stateRendererType: stateRendererType,
              ),
            ],
          ),
        );
    }
  }
}
