import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:receiptiq_mobile/core/widgets/api_state_widget.dart';
import 'package:receiptiq_mobile/core/widgets/empty_state.dart';
import '../domain/household_models.dart';
import '../application/household_controller.dart';

class HouseholdScreen extends ConsumerWidget {
  const HouseholdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(householdControllerProvider);
    final controller = ref.read(householdControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspaces'),
      ),
      body: ApiStateWidget<List<HouseholdModel>>(
        state: state.households,
        onRetry: controller.refresh,
        builder: (context, households) {
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildWorkspaceSwitcher(context, state, households, controller),
                const SizedBox(height: 24),
                if (state.activeWorkspace.type == WorkspaceType.personal)
                  _buildPersonalView(context, controller)
                else
                  _buildHouseholdView(context, state, households, controller),
              ],
            ),
          );
        },
      ),
      floatingActionButton: state.activeWorkspace.type == WorkspaceType.household
          ? FloatingActionButton.extended(
              onPressed: () => _showInviteDialog(context, controller, state.activeWorkspace.householdId!),
              icon: const Icon(Icons.person_add),
              label: const Text('Invite Member'),
            )
          : null,
    );
  }

  Widget _buildWorkspaceSwitcher(BuildContext context, HouseholdState state, List<HouseholdModel> households, HouseholdController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Active Workspace', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: const Text('👤 Personal'),
                selected: state.activeWorkspace.type == WorkspaceType.personal,
                onSelected: (selected) {
                  if (selected) controller.switchWorkspace(const Workspace(type: WorkspaceType.personal));
                },
              ),
              const SizedBox(width: 8),
              ...households.map((h) {
                final isSelected = state.activeWorkspace.type == WorkspaceType.household && state.activeWorkspace.householdId == h.id;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text('🏠 ${h.name}'),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        controller.switchWorkspace(Workspace(
                          type: WorkspaceType.household,
                          householdId: h.id,
                          householdName: h.name,
                        ));
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalView(BuildContext context, HouseholdController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 48),
        const Icon(Icons.person, size: 64, color: Colors.grey),
        const SizedBox(height: 16),
        Text('Personal Workspace', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'Receipts and analytics here are completely private to you.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: () => _showCreateHouseholdDialog(context, controller),
          icon: const Icon(Icons.add_home),
          label: const Text('Create a Household'),
        ),
      ],
    );
  }

  Widget _buildHouseholdView(BuildContext context, HouseholdState state, List<HouseholdModel> households, HouseholdController controller) {
    final activeHousehold = households.where((h) => h.id == state.activeWorkspace.householdId).firstOrNull;

    if (activeHousehold == null) {
      return EmptyState(
        icon: Icons.group_off,
        title: 'Household Not Found',
        message: 'This household may have been deleted.',
        buttonLabel: 'Switch to Personal',
        onButtonPressed: () => controller.switchWorkspace(const Workspace(type: WorkspaceType.personal)),
      );
    }

    final owner = activeHousehold.members.where((m) => m.role == HouseholdRole.owner).firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.home, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        activeHousehold.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (owner != null) ...[
                      const Icon(Icons.shield, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('Owner: ${owner.email.split("@").first}', style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 16),
                    ],
                    const Icon(Icons.people, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${activeHousehold.members.length} Members', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Members', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        ...activeHousehold.members.map((member) => _buildMemberCard(context, member)),
      ],
    );
  }

  Widget _buildMemberCard(BuildContext context, HouseholdMemberModel member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Text(member.email.substring(0, 1).toUpperCase()),
        ),
        title: Text(member.email.split('@').first, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(member.email, style: const TextStyle(fontSize: 12)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: member.role == HouseholdRole.owner
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            member.role.name.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: member.role == HouseholdRole.owner ? Theme.of(context).colorScheme.onPrimaryContainer : null,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCreateHouseholdDialog(BuildContext context, HouseholdController controller) async {
    final nameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Create Household'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: 'e.g. Flatmates, Family'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty) return;
              Navigator.pop(ctx);
              final success = await controller.createHousehold(nameController.text.trim());
              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Household created successfully!')));
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<void> _showInviteDialog(BuildContext context, HouseholdController controller, String householdId) async {
    final emailController = TextEditingController();
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invite Member'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Email address'),
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              if (emailController.text.trim().isEmpty) return;
              Navigator.pop(ctx);
              final success = await controller.inviteMember(householdId, emailController.text.trim(), HouseholdRole.member);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(success ? 'Invitation sent successfully!' : 'Failed to send invitation.')),
                );
              }
            },
            child: const Text('Send Invite'),
          ),
        ],
      ),
    );
  }
}
