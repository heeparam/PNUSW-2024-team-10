import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotionView extends StatefulWidget {
  const NotionView({super.key});

  @override
  State<NotionView> createState() => _NotionViewState();
}

class _NotionViewState extends State<NotionView> {
  WebViewController? controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          controller?.runJavaScript(_notionScript);
        },
      ))
      ..loadRequest(Uri.parse(_notionUrl));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notionBackground = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF191919)
        : Colors.white;

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: notionBackground,
      child: controller != null ? WebViewWidget(controller: controller!) : null,
    );
  }
}

void removeLinkButtons(WebViewController controller) {
  controller.runJavaScript(_notionScript);
}

const _notionUrl =
    "https://futuristic-budget-d22.notion.site/ce0ed34714004a97b8156d5d824c8160?v=11eb5d1ffec14b5c8f961cd0613b0ceb&pvs=4";

const _notionScript = """
function removeLinkButtons() {
    const topBar = document.querySelector("div.notion-topbar-mobile");
    
    if (topBar) {
        for (const node of topBar.childNodes) {
            if (node.getAttribute("role") === "button") {
                node.style.display = "none"
            }
        }
    }
}

const observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
        if (mutation.type === "childList" || mutation.type === "subtree") {
            removeLinkButtons();
        }
    });
});

observer.observe(document.body, {
    childList: true,
    subtree: true
});

removeLinkButtons();
""";
