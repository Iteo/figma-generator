import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WidgetPreview extends HookWidget {
  const WidgetPreview(this.widget, {Key? key}) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final width = useState<double>(200);
    final height = useState<double>(128);

    final center = useState<bool>(false);

    final key = useState(GlobalKey());

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        try {
          width.value = key.value.currentContext?.size?.width ?? 200.0;
          height.value = key.value.currentContext?.size?.height ?? 128.0;
        } catch (_) {
          width.value = 200.0;
          height.value = 128.0;
        }
      });
    }, [widget]);

    Widget _info(String text, Color color) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color.withOpacity(0.12),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: color,
                ),
          ),
        );

    Widget _infoSize(String text, ValueNotifier<double> value, Color color) =>
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: color.withOpacity(0.12),
                contentPadding: EdgeInsets.zero,
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 48,
                  child: TextField(
                    autofocus: true,
                    cursorColor: color,
                    decoration: InputDecoration(
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: color,
                              ),
                      labelText: text,
                      focusColor: color,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: color,
                        ),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (s) =>
                        value.value = double.parse(s.replaceAll(",", ".")),
                  ),
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color.withOpacity(0.12),
            ),
            child: Text(
              "$text = ${value.value.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: color,
                  ),
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
        actions: [
          IconButton(
            onPressed: () {
              width.value = key.value.currentContext?.size?.width ?? 200.0;
              height.value = key.value.currentContext?.size?.height ?? 128.0;
              center.value = false;
            },
            icon: const Icon(
              Icons.restart_alt_rounded,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 42),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _infoSize(
                  "width",
                  width,
                  Colors.blue,
                ),
                const SizedBox(width: 8),
                _infoSize(
                  "height",
                  height,
                  Colors.red,
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    center.value = !center.value;
                  },
                  child: _info(
                    "center: ${center.value}",
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0,
            child: SizedBox(
              key: key.value,
              child: Flexible(
                child: widget,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.001,
            child: GridView.builder(
              shrinkWrap: true,
              controller: ScrollController(keepScrollOffset: false),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: MediaQuery.of(context).size.width.toInt() *
                  (MediaQuery.of(context).size.height * 0.1).toInt(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 24,
                childAspectRatio: 1,
                mainAxisExtent: 24,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.orange,
                      width: 0.1,
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (update) {
              width.value = update.localPosition.dx;
            },
            onVerticalDragUpdate: (update) {
              height.value = update.localPosition.dy;
            },
            child: center.value
                ? Center(
                    child: Container(
                      color: Colors.orange.withOpacity(0.12),
                      width: width.value,
                      height: height.value,
                      child: AbsorbPointer(
                        absorbing: true,
                        child: widget,
                      ),
                    ),
                  )
                : Container(
                    color: Colors.orange.withOpacity(0.12),
                    width: width.value,
                    height: height.value,
                    child: AbsorbPointer(
                      absorbing: true,
                      child: widget,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
