export type YardCrab = { id: string; agentId?: string; tier: string; at?: number }

export type Yard = {
  busy: boolean
  doneAt: number
  crabs: YardCrab[]
}

declare module 'claude-code' {
  interface PluginState {
    'crabby': {
      yard: Yard
    }
  }
}
