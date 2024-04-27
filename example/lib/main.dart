import 'package:fhir_client/models/value_sets/resource_type.dart';
import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';
import 'package:arborio/tree_view.dart';

const title = 'FHIR Explorer';

class NodeData {
  final String display;
  NodeData(this.display);
}

class TreeState extends ChangeNotifier {
  List<TreeNode<NodeData>> rootNodes = ResourceType.values
      .map((e) => TreeNode<NodeData>(
            ValueKey(e.code),
            NodeData(e.display),
          ))
      .toList();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        )),
        home: SplitViewExample(),
      );
}

class SplitViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: SplitView(
          viewMode: SplitViewMode.Horizontal,
          children: [
            TreeViewPanel(),
            FormPanel(),
          ],
        ),
      );
}

class TreeViewPanel extends StatefulWidget {
  @override
  State<TreeViewPanel> createState() => _TreeViewPanelState();
}

class _TreeViewPanelState extends State<TreeViewPanel> {
  final _treeState = TreeState();
  TreeNode<NodeData>? _selectedNode;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[200],
        child: Center(
          child: AnimatedBuilder(
            animation: _treeState,
            builder: (context, child) => Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _treeView(),
              ),
            ),
          ),
        ),
      );

  TreeView<NodeData> _treeView() => TreeView(
        onSelectionChanged: (node) => setState(() => _selectedNode = node),
        //key: treeViewKey,
        animationDuration: const Duration(milliseconds: 100),
        animationCurve: Curves.easeIn,
        builder: (
          context,
          node,
          isSelected,
          expansionAnimation,
          select,
        ) =>
            InkWell(
          onTap: () => select(node),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(.3),
                        Theme.of(context).colorScheme.primary.withOpacity(.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.data_array),
                  const SizedBox(width: 16),
                  Text(node.data.display),
                ],
              ),
            ),
          ),
        ),
        nodes: _treeState.rootNodes,
        expanderBuilder: (context, node, animationValue) => RotationTransition(
          turns: animationValue,
          child: const Icon(Icons.chevron_right),
        ),
        dragBuilder: (context, node) => const Icon(
          Icons.chevron_right_outlined,
          color: Colors.green,
        ),
      );
}

class FormPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[300],
        child: const Center(
          child: Text('Form'),
        ),
      );
}
