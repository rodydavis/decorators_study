import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Email app'),
        ),
        body: const EmailPage(),
      ),
    ),
  );
}

class Email {
  Email({required this.subject, required this.sender});

  final String sender;
  final String subject;
}

final emails = [
  Email(
    sender: 'FN',
    subject: 'Need flour?',
  ),
  Email(
    sender: 'HC',
    subject: 'Thank you for the coffee!',
  ),
];

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        return EmailCard(email: emails[index]);
      }
    );
  }
}

class EmailCard extends StatefulWidget {
  const EmailCard({
    super.key,
    required this.email,
  });

  final Email email;

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(widget.email.sender)
          .padding(padding: EdgeInsets.all(16.0))
          .container(
            color: Colors.deepPurple.shade100,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              shape: BoxShape.circle,
            ),
          ),

        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8.0,
          children: [
            Text('Unread')
              .padding(padding: EdgeInsets.all(8.0))
              .decoratedBox(
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),

            Text(widget.email.subject)
              .mouseRegion(
                onEnter: (event) => setState(() => _isHovering = true),
                onExit: (event) => setState(() => _isHovering = false),
              ),
          ],
        ),

        trailing: _isHovering
          ? IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )
          : null,
      ),
    );
  }
}
