import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  final VoidCallback onSwipe;
  final Widget child;
  final Widget background;
  const DraggableCard({super.key, required this.onSwipe, required this.child, required this.background});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  double _swipeAmount = 0.0;
  bool _hasSwiped = false;

  void _updateSwipeAmount(DragUpdateDetails details) { 
    setState(() { 
      _swipeAmount += details.primaryDelta!; 
      if (_swipeAmount < 0) { 
        _swipeAmount = 0; 
        _hasSwiped = false; 
      }
      if (_swipeAmount >= 100) {
        _swipeAmount = 100;
      }
    }); 
  } 
    
  void _endSwipe(DragEndDetails details) {
    if (_swipeAmount >= 100 && !_hasSwiped) {
      _hasSwiped = true; widget.onSwipe(); 
    } 
    setState(() { 
      _swipeAmount = 0;
       _hasSwiped = false; 
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.background,
        GestureDetector(
          onHorizontalDragUpdate: _updateSwipeAmount,
          onHorizontalDragEnd: _endSwipe,
          child: Transform.translate(
            offset: Offset(_swipeAmount, 0),
            child: widget.child
          ),
        )
      ],
    );
  }
}