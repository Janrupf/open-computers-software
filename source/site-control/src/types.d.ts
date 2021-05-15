declare module "event" {
    /**
     * Pulls and returns the next available event from the queue, or waits until one becomes available.
     * @tupleReturn
     */
    function pull<T extends any[]>(timeout: number, name: string): Concat<[string], T>;
}