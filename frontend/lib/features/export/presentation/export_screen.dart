import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../domain/export_models.dart';
import '../application/export_controller.dart';
import 'widgets/export_progress_dialog.dart';

class ExportScreen extends ConsumerStatefulWidget {
  const ExportScreen({super.key});

  @override
  ConsumerState<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends ConsumerState<ExportScreen> {
  ExportFormat _selectedFormat = ExportFormat.pdf;
  ReportPeriod _selectedPeriod = ReportPeriod.thisMonth;
  bool _includeSummary = true;
  bool _includeReceipts = true;
  bool _includeCategories = true;
  bool _includeHousehold = false;

  void _generateExport() {
    final request = ExportRequest(
      format: _selectedFormat,
      period: _selectedPeriod,
      includeSummary: _includeSummary,
      includeReceipts: _includeReceipts,
      includeCategories: _includeCategories,
      includeHousehold: _includeHousehold,
    );

    ref.read(exportControllerProvider).generateReport(request);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ExportProgressDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Reports')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFormatSelector(context),
          const SizedBox(height: 24),
          _buildPeriodSelector(context),
          const SizedBox(height: 24),
          _buildIncludeOptions(context),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _generateExport,
            icon: const Icon(Icons.file_download),
            label: const Text('Generate Report'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 48),
          _buildRecentExports(context),
        ],
      ),
    );
  }

  Widget _buildFormatSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Report Type', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildFormatCard('📄 PDF', ExportFormat.pdf),
            const SizedBox(width: 8),
            _buildFormatCard('📊 Excel', ExportFormat.excel),
            const SizedBox(width: 8),
            _buildFormatCard('📋 CSV', ExportFormat.csv),
          ],
        )
      ],
    );
  }

  Widget _buildFormatCard(String title, ExportFormat format) {
    final isSelected = _selectedFormat == format;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedFormat = format),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
            border: Border.all(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date Range', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ReportPeriod.values.map((p) {
            final isSelected = _selectedPeriod == p;
            return ChoiceChip(
              label: Text(_formatEnumName(p.name)),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) setState(() => _selectedPeriod = p);
              },
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildIncludeOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Include in Report', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        CheckboxListTile(
          title: const Text('Executive Summary'),
          value: _includeSummary,
          onChanged: _selectedFormat == ExportFormat.pdf ? (val) => setState(() => _includeSummary = val!) : null,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Text('Receipt Ledger'),
          value: _includeReceipts,
          onChanged: (val) => setState(() => _includeReceipts = val!),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Text('Expense Categories'),
          value: _includeCategories,
          onChanged: _selectedFormat != ExportFormat.csv ? (val) => setState(() => _includeCategories = val!) : null,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Text('Household Summary'),
          value: _includeHousehold,
          onChanged: (val) => setState(() => _includeHousehold = val!),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }

  Widget _buildRecentExports(BuildContext context) {
    final history = ref.watch(exportHistoryProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Exports', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (history.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text('No recent exports. Generate a report to see it here.', style: TextStyle(color: Colors.grey)),
          )
        else
          ...history.map((item) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(child: Icon(Icons.description)),
            title: Text(item.fileName, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(DateFormat.yMMMd().format(item.date)),
            trailing: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Implement share from history
              },
            ),
          )),
      ],
    );
  }

  String _formatEnumName(String name) {
    // Converts "thisMonth" to "This Month"
    return name.replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}').replaceFirstMapped(RegExp(r'^[a-z]'), (match) => match.group(0)!.toUpperCase());
  }
}
